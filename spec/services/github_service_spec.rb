# spec/services/github_service_spec.rb
require 'rails_helper'

RSpec.describe GithubService do
  let(:user) { create(:user, github_token: 'fake_token') }
  let(:service) { described_class.new(user) }

  describe '#fetch_repositories' do
    it 'returns repositories for the user' do
      client = instance_double(Octokit::Client)
      allow(Octokit::Client).to receive(:new).and_return(client)
      allow(client).to receive(:repositories).and_return([ { id: 1, name: 'Repo1', description: 'Description1', html_url: 'http://example.com/repo1' } ])

      repos = service.fetch_repositories
      expect(repos.size).to eq(1)
      expect(repos.first[:name]).to eq('Repo1')
    end
  end

  describe '#import_project' do
    it 'creates a new project from a repository' do
      repo = { id: 1, name: 'Repo1', description: 'Description1', html_url: 'http://example.com/repo1' }
      project = service.import_project(repo)
      expect(Project.count).to eq(1)
      expect(project.title).to eq('Repo1')
    end
  end
end
