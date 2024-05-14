# spec/services/gitlab_service_spec.rb
require 'rails_helper'

RSpec.describe GitlabService do
  let(:user) { create(:user, gitlab_token: 'fake_token') }
  let(:service) { described_class.new(user) }

  describe '#fetch_projects' do
    it 'returns projects for the user' do
      client = instance_double(Gitlab::Client)
      allow(Gitlab).to receive(:client).and_return(client)
      allow(client).to receive(:projects).and_return([ Gitlab::ObjectifiedHash.new(id: 1, name: 'Project1', description: 'Description1', web_url: 'http://example.com/project1') ])

      projects = service.fetch_projects
      expect(projects.size).to eq(1)
      expect(projects.first.name).to eq('Project1')
    end
  end

  describe '#import_project' do
    it 'creates a new project from a GitLab project' do
      project = Gitlab::ObjectifiedHash.new(id: 1, name: 'Project1', description: 'Description1', web_url: 'http://example.com/project1')
      new_project = service.import_project(project)
      expect(Project.count).to eq(1)
      expect(new_project.title).to eq('Project1')
    end
  end
end
