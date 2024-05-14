# app/services/github_service.rb
class GithubService
  def initialize(user)
    @user = user
    @client = Octokit::Client.new(access_token: @user.github_token)
  end

  def fetch_repositories
    @client.repositories
  end

  def import_project(repo)
    project = @user.projects.create!(
      title: repo[:name],
      description: repo[:description],
      source: 'github',
      source_url: repo[:html_url]
    )
    project
  end
end
