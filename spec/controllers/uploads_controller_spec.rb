require 'spec_helper'
shared_examples 'content not cached without revalidation' do
  it 'ensures content will not be cached without revalidation' do
    expect(subject['Cache-Control']).to eq('max-age=0, private, must-revalidate')
  end
end

describe UploadsController do
  let!(:user) { create(:user, avatar: fixture_file_upload(Rails.root + "spec/fixtures/dk.png", "image/png")) }

  describe "GET show" do
    context 'Content-Disposition security measures' do
      let(:project) { create(:empty_project, :public) }

      context 'for PNG files' do
        it 'returns Content-Disposition: inline' do
          note = create(:note, :with_attachment, project: project)
          get :show, model: 'note', mounted_as: 'attachment', id: note.id, filename: 'image.png'

          expect(response['Content-Disposition']).to start_with('inline;')
        end
      end

      context 'for SVG files' do
        it 'returns Content-Disposition: attachment' do
          note = create(:note, :with_svg_attachment, project: project)
          get :show, model: 'note', mounted_as: 'attachment', id: note.id, filename: 'image.svg'

          expect(response['Content-Disposition']).to start_with('attachment;')
        end
      end
    end

    context "when viewing a user avatar" do
      context "when signed in" do
        before do
          sign_in(user)
        end

        context "when the user is blocked" do
          before do
            user.block
          end

          it "redirects to the sign in page" do
            get :show, model: "user", mounted_as: "avatar", id: user.id, filename: "image.png"

            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "when the user isn't blocked" do
          it "responds with status 200" do
            get :show, model: "user", mounted_as: "avatar", id: user.id, filename: "image.png"

            expect(response).to have_http_status(200)
          end

          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'user', mounted_as: 'avatar', id: user.id, filename: 'image.png'
              response
            end
          end
        end
      end

      context "when not signed in" do
        it "responds with status 200" do
          get :show, model: "user", mounted_as: "avatar", id: user.id, filename: "image.png"

          expect(response).to have_http_status(200)
        end

        it_behaves_like 'content not cached without revalidation' do
          subject do
            get :show, model: 'user', mounted_as: 'avatar', id: user.id, filename: 'image.png'
            response
          end
        end
      end
    end

    context "when viewing a project avatar" do
      let!(:project) { create(:empty_project, avatar: fixture_file_upload(Rails.root + "spec/fixtures/dk.png", "image/png")) }

      context "when the project is public" do
        before do
          project.update_attribute(:visibility_level, Project::PUBLIC)
        end

        context "when not signed in" do
          it "responds with status 200" do
            get :show, model: "project", mounted_as: "avatar", id: project.id, filename: "image.png"

            expect(response).to have_http_status(200)
          end

          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'project', mounted_as: 'avatar', id: project.id, filename: 'image.png'
              response
            end
          end
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          it "responds with status 200" do
            get :show, model: "project", mounted_as: "avatar", id: project.id, filename: "image.png"

            expect(response).to have_http_status(200)
          end

          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'project', mounted_as: 'avatar', id: project.id, filename: 'image.png'
              response
            end
          end
        end
      end

      context "when the project is private" do
        before do
          project.update_attribute(:visibility_level, Project::PRIVATE)
        end

        context "when not signed in" do
          it "redirects to the sign in page" do
            get :show, model: "project", mounted_as: "avatar", id: project.id, filename: "image.png"

            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          context "when the user has access to the project" do
            before do
              project.team << [user, :master]
            end

            context "when the user is blocked" do
              before do
                user.block
                project.team << [user, :master]
              end

              it "redirects to the sign in page" do
                get :show, model: "project", mounted_as: "avatar", id: project.id, filename: "image.png"

                expect(response).to redirect_to(new_user_session_path)
              end
            end

            context "when the user isn't blocked" do
              it "responds with status 200" do
                get :show, model: "project", mounted_as: "avatar", id: project.id, filename: "image.png"

                expect(response).to have_http_status(200)
              end

              it_behaves_like 'content not cached without revalidation' do
                subject do
                  get :show, model: 'project', mounted_as: 'avatar', id: project.id, filename: 'image.png'
                  response
                end
              end
            end
          end

          context "when the user doesn't have access to the project" do
            it "responds with status 404" do
              get :show, model: "project", mounted_as: "avatar", id: project.id, filename: "image.png"

              expect(response).to have_http_status(404)
            end
          end
        end
      end
    end

    context "when viewing a group avatar" do
      let!(:group)   { create(:group, avatar: fixture_file_upload(Rails.root + "spec/fixtures/dk.png", "image/png")) }

      context "when the group is public" do
        context "when not signed in" do
          it "responds with status 200" do
            get :show, model: "group", mounted_as: "avatar", id: group.id, filename: "image.png"

            expect(response).to have_http_status(200)
          end

          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'group', mounted_as: 'avatar', id: group.id, filename: 'image.png'
              response
            end
          end
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          it "responds with status 200" do
            get :show, model: "group", mounted_as: "avatar", id: group.id, filename: "image.png"

            expect(response).to have_http_status(200)
          end

          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'group', mounted_as: 'avatar', id: group.id, filename: 'image.png'
              response
            end
          end
        end
      end

      context "when the group is private" do
        before do
          group.update_attribute(:visibility_level, Gitlab::VisibilityLevel::PRIVATE)
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          context "when the user has access to the project" do
            before do
              group.add_developer(user)
            end

            context "when the user is blocked" do
              before do
                user.block
              end

              it "redirects to the sign in page" do
                get :show, model: "group", mounted_as: "avatar", id: group.id, filename: "image.png"

                expect(response).to redirect_to(new_user_session_path)
              end
            end

            context "when the user isn't blocked" do
              it "responds with status 200" do
                get :show, model: "group", mounted_as: "avatar", id: group.id, filename: "image.png"

                expect(response).to have_http_status(200)
              end

              it_behaves_like 'content not cached without revalidation' do
                subject do
                  get :show, model: 'group', mounted_as: 'avatar', id: group.id, filename: 'image.png'
                  response
                end
              end
            end
          end

          context "when the user doesn't have access to the project" do
            it "responds with status 404" do
              get :show, model: "group", mounted_as: "avatar", id: group.id, filename: "image.png"

              expect(response).to have_http_status(404)
            end
          end
        end
      end
    end

    context "when viewing a note attachment" do
      let!(:note) { create(:note, :with_attachment) }
      let(:project) { note.project }

      context "when the project is public" do
        before do
          project.update_attribute(:visibility_level, Project::PUBLIC)
        end

        context "when not signed in" do
          it "responds with status 200" do
            get :show, model: "note", mounted_as: "attachment", id: note.id, filename: "image.png"

            expect(response).to have_http_status(200)
          end

          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'note', mounted_as: 'attachment', id: note.id, filename: 'image.png'
              response
            end
          end
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          it "responds with status 200" do
            get :show, model: "note", mounted_as: "attachment", id: note.id, filename: "image.png"

            expect(response).to have_http_status(200)
          end

          it_behaves_like 'content not cached without revalidation' do
            subject do
              get :show, model: 'note', mounted_as: 'attachment', id: note.id, filename: 'image.png'
              response
            end
          end
        end
      end

      context "when the project is private" do
        before do
          project.update_attribute(:visibility_level, Project::PRIVATE)
        end

        context "when not signed in" do
          it "redirects to the sign in page" do
            get :show, model: "note", mounted_as: "attachment", id: note.id, filename: "image.png"

            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "when signed in" do
          before do
            sign_in(user)
          end

          context "when the user has access to the project" do
            before do
              project.team << [user, :master]
            end

            context "when the user is blocked" do
              before do
                user.block
                project.team << [user, :master]
              end

              it "redirects to the sign in page" do
                get :show, model: "note", mounted_as: "attachment", id: note.id, filename: "image.png"

                expect(response).to redirect_to(new_user_session_path)
              end
            end

            context "when the user isn't blocked" do
              it "responds with status 200" do
                get :show, model: "note", mounted_as: "attachment", id: note.id, filename: "image.png"

                expect(response).to have_http_status(200)
              end

              it_behaves_like 'content not cached without revalidation' do
                subject do
                  get :show, model: 'note', mounted_as: 'attachment', id: note.id, filename: 'image.png'
                  response
                end
              end
            end
          end

          context "when the user doesn't have access to the project" do
            it "responds with status 404" do
              get :show, model: "note", mounted_as: "attachment", id: note.id, filename: "image.png"

              expect(response).to have_http_status(404)
            end
          end
        end
      end
    end
  end
end
