require 'rails_helper'

feature 'Merge Requests > User uses slash commands', feature: true, js: true do
  include SlashCommandsHelpers
  include WaitForAjax

  let(:user) { create(:user) }
  let(:project) { create(:project, :public) }
  let(:merge_request) { create(:merge_request, source_project: project) }
  let!(:milestone) { create(:milestone, project: project, title: 'ASAP') }

  it_behaves_like 'issuable record that supports slash commands in its description and notes', :merge_request do
    let(:issuable) { create(:merge_request, source_project: project) }
    let(:new_url_opts) { { merge_request: { source_branch: 'feature', target_branch: 'master' } } }
  end

  describe 'merge-request-only commands' do
    before do
      project.team << [user, :master]
      login_with(user)
      visit namespace_project_merge_request_path(project.namespace, project, merge_request)
    end

    after do
      wait_for_ajax
    end

    describe 'toggling the WIP prefix in the title from note' do
      context 'when the current user can toggle the WIP prefix' do
        it 'adds the WIP: prefix to the title' do
          write_note("/wip")

          expect(page).not_to have_content '/wip'
          expect(page).to have_content 'Commands applied'

          expect(merge_request.reload.work_in_progress?).to eq true
        end

        it 'removes the WIP: prefix from the title' do
          merge_request.title = merge_request.wip_title
          merge_request.save
          write_note("/wip")

          expect(page).not_to have_content '/wip'
          expect(page).to have_content 'Commands applied'

          expect(merge_request.reload.work_in_progress?).to eq false
        end
      end

      context 'when the current user cannot toggle the WIP prefix' do
        let(:guest) { create(:user) }
        before do
          project.team << [guest, :guest]
          logout
          login_with(guest)
          visit namespace_project_merge_request_path(project.namespace, project, merge_request)
        end

        it 'does not change the WIP prefix' do
          write_note("/wip")

          expect(page).not_to have_content '/wip'
          expect(page).not_to have_content 'Commands applied'

          expect(merge_request.reload.work_in_progress?).to eq false
        end
      end
    end

    describe 'merging the MR from the note' do
      context 'when the current user can merge the MR' do
        it 'merges the MR' do
          write_note("/merge")

          expect(page).to have_content 'Commands applied'

          expect(merge_request.reload).to be_merged
        end
      end

      context 'when the head diff changes in the meanwhile' do
        before do
          merge_request.source_branch = 'another_branch'
          merge_request.save
        end

        it 'does not merge the MR' do
          write_note("/merge")

          expect(page).not_to have_content 'Your commands have been executed!'

          expect(merge_request.reload).not_to be_merged
        end
      end

      context 'when the current user cannot merge the MR' do
        let(:guest) { create(:user) }
        before do
          project.team << [guest, :guest]
          logout
          login_with(guest)
          visit namespace_project_merge_request_path(project.namespace, project, merge_request)
        end

        it 'does not merge the MR' do
          write_note("/merge")

          expect(page).not_to have_content 'Your commands have been executed!'

          expect(merge_request.reload).not_to be_merged
        end
      end
    end

    describe 'adding a due date from note' do
      it 'does not recognize the command nor create a note' do
        write_note('/due 2016-08-28')

        expect(page).not_to have_content '/due 2016-08-28'
      end
    end

    describe '/target_branch command in merge request' do
      let(:another_project) { create(:project, :public) }
      let(:new_url_opts) { { merge_request: { source_branch: 'feature' } } }

      before do
        logout
        another_project.team << [user, :master]
        login_with(user)
      end

      it 'changes target_branch in new merge_request' do
        visit new_namespace_project_merge_request_path(another_project.namespace, another_project, new_url_opts)

        fill_in "merge_request_title", with: 'My brand new feature'
        fill_in "merge_request_description", with: "le feature \n/target_branch fix\nFeature description:"
        click_button "Submit merge request"

        merge_request = another_project.merge_requests.first
        expect(merge_request.description).to eq "le feature \nFeature description:"
        expect(merge_request.target_branch).to eq 'fix'
      end

      it 'does not change target branch when merge request is edited' do
        new_merge_request = create(:merge_request, source_project: another_project)

        visit edit_namespace_project_merge_request_path(another_project.namespace, another_project, new_merge_request)
        fill_in "merge_request_description", with: "Want to update target branch\n/target_branch fix\n"
        click_button "Save changes"

        new_merge_request = another_project.merge_requests.first
        expect(new_merge_request.description).to include('/target_branch')
        expect(new_merge_request.target_branch).not_to eq('fix')
      end
    end

    describe '/target_branch command from note' do
      context 'when the current user can change target branch' do
        it 'changes target branch from a note' do
          write_note("message start \n/target_branch merge-test\n message end.")

          expect(page).not_to have_content('/target_branch')
          expect(page).to have_content('message start')
          expect(page).to have_content('message end.')

          expect(merge_request.reload.target_branch).to eq 'merge-test'
        end

        it 'does not fail when target branch does not exists' do
          write_note('/target_branch totally_not_existing_branch')

          expect(page).not_to have_content('/target_branch')

          expect(merge_request.target_branch).to eq 'feature'
        end
      end

      context 'when current user can not change target branch' do
        let(:guest) { create(:user) }
        before do
          project.team << [guest, :guest]
          logout
          login_with(guest)
          visit namespace_project_merge_request_path(project.namespace, project, merge_request)
        end

        it 'does not change target branch' do
          write_note('/target_branch merge-test')

          expect(page).not_to have_content '/target_branch merge-test'

          expect(merge_request.target_branch).to eq 'feature'
        end
      end
    end

    describe 'adding a weight from a note' do
      it 'does not recognize the command nor create a note' do
        write_note("/weight 5")

        expect(page).not_to have_content '/weight 5'
      end
    end
  end
end
