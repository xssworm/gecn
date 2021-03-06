require 'spec_helper'

describe "Public Project Snippets Access", feature: true  do
  include AccessMatchers

  let(:project) { create(:empty_project, :public) }

  let(:public_snippet)   { create(:project_snippet, :public,   project: project, author: project.owner) }
  let(:internal_snippet) { create(:project_snippet, :internal, project: project, author: project.owner) }
  let(:private_snippet)  { create(:project_snippet, :private,  project: project, author: project.owner) }

  describe "GET /:project_path/snippets" do
    subject { namespace_project_snippets_path(project.namespace, project) }

    it { is_expected.to be_allowed_for(:admin) }
    it { is_expected.to be_allowed_for(:auditor) }
    it { is_expected.to be_allowed_for(:owner).of(project) }
    it { is_expected.to be_allowed_for(:master).of(project) }
    it { is_expected.to be_allowed_for(:developer).of(project) }
    it { is_expected.to be_allowed_for(:reporter).of(project) }
    it { is_expected.to be_allowed_for(:guest).of(project) }
    it { is_expected.to be_allowed_for(:user) }
    it { is_expected.to be_allowed_for(:external) }
    it { is_expected.to be_allowed_for(:visitor) }
  end

  describe "GET /:project_path/snippets/new" do
    subject { new_namespace_project_snippet_path(project.namespace, project) }

    it { is_expected.to be_allowed_for(:admin) }
    it { is_expected.to be_denied_for(:auditor) }
    it { is_expected.to be_allowed_for(:owner).of(project) }
    it { is_expected.to be_allowed_for(:master).of(project) }
    it { is_expected.to be_allowed_for(:developer).of(project) }
    it { is_expected.to be_allowed_for(:reporter).of(project) }
    it { is_expected.to be_denied_for(:guest).of(project) }
    it { is_expected.to be_denied_for(:user) }
    it { is_expected.to be_denied_for(:external) }
    it { is_expected.to be_denied_for(:visitor) }
  end

  describe "GET /:project_path/snippets/:id" do
    context "for a public snippet" do
      subject { namespace_project_snippet_path(project.namespace, project, public_snippet) }

      it { is_expected.to be_allowed_for(:admin) }
      it { is_expected.to be_allowed_for(:auditor) }
      it { is_expected.to be_allowed_for(:owner).of(project) }
      it { is_expected.to be_allowed_for(:master).of(project) }
      it { is_expected.to be_allowed_for(:developer).of(project) }
      it { is_expected.to be_allowed_for(:reporter).of(project) }
      it { is_expected.to be_allowed_for(:guest).of(project) }
      it { is_expected.to be_allowed_for(:user) }
      it { is_expected.to be_allowed_for(:external) }
      it { is_expected.to be_allowed_for(:visitor) }
    end

    context "for an internal snippet" do
      subject { namespace_project_snippet_path(project.namespace, project, internal_snippet) }

      it { is_expected.to be_allowed_for(:admin) }
      it { is_expected.to be_allowed_for(:auditor) }
      it { is_expected.to be_allowed_for(:owner).of(project) }
      it { is_expected.to be_allowed_for(:master).of(project) }
      it { is_expected.to be_allowed_for(:developer).of(project) }
      it { is_expected.to be_allowed_for(:reporter).of(project) }
      it { is_expected.to be_allowed_for(:guest).of(project) }
      it { is_expected.to be_allowed_for(:user) }
      it { is_expected.to be_denied_for(:external) }
      it { is_expected.to be_denied_for(:visitor) }
    end

    context "for a private snippet" do
      subject { namespace_project_snippet_path(project.namespace, project, private_snippet) }

      it { is_expected.to be_allowed_for(:admin) }
      it { is_expected.to be_allowed_for(:auditor) }
      it { is_expected.to be_allowed_for(:owner).of(project) }
      it { is_expected.to be_allowed_for(:master).of(project) }
      it { is_expected.to be_allowed_for(:developer).of(project) }
      it { is_expected.to be_allowed_for(:reporter).of(project) }
      it { is_expected.to be_allowed_for(:guest).of(project) }
      it { is_expected.to be_denied_for(:user) }
      it { is_expected.to be_denied_for(:external) }
      it { is_expected.to be_denied_for(:visitor) }
    end
  end

  describe "GET /:project_path/snippets/:id/raw" do
    context "for a public snippet" do
      subject { raw_namespace_project_snippet_path(project.namespace, project, public_snippet) }

      it { is_expected.to be_allowed_for(:admin) }
      it { is_expected.to be_allowed_for(:auditor) }
      it { is_expected.to be_allowed_for(:owner).of(project) }
      it { is_expected.to be_allowed_for(:master).of(project) }
      it { is_expected.to be_allowed_for(:developer).of(project) }
      it { is_expected.to be_allowed_for(:reporter).of(project) }
      it { is_expected.to be_allowed_for(:guest).of(project) }
      it { is_expected.to be_allowed_for(:user) }
      it { is_expected.to be_allowed_for(:external) }
      it { is_expected.to be_allowed_for(:visitor) }
    end

    context "for an internal snippet" do
      subject { raw_namespace_project_snippet_path(project.namespace, project, internal_snippet) }

      it { is_expected.to be_allowed_for(:admin) }
      it { is_expected.to be_allowed_for(:auditor) }
      it { is_expected.to be_allowed_for(:owner).of(project) }
      it { is_expected.to be_allowed_for(:master).of(project) }
      it { is_expected.to be_allowed_for(:developer).of(project) }
      it { is_expected.to be_allowed_for(:reporter).of(project) }
      it { is_expected.to be_allowed_for(:guest).of(project) }
      it { is_expected.to be_allowed_for(:user) }
      it { is_expected.to be_denied_for(:external) }
      it { is_expected.to be_denied_for(:visitor) }
    end

    context "for a private snippet" do
      subject { raw_namespace_project_snippet_path(project.namespace, project, private_snippet) }

      it { is_expected.to be_allowed_for(:admin) }
      it { is_expected.to be_allowed_for(:auditor) }
      it { is_expected.to be_allowed_for(:owner).of(project) }
      it { is_expected.to be_allowed_for(:master).of(project) }
      it { is_expected.to be_allowed_for(:developer).of(project) }
      it { is_expected.to be_allowed_for(:reporter).of(project) }
      it { is_expected.to be_allowed_for(:guest).of(project) }
      it { is_expected.to be_denied_for(:user) }
      it { is_expected.to be_denied_for(:external) }
      it { is_expected.to be_denied_for(:visitor) }
    end
  end
end
