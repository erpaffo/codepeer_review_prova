# app/services/gitlab_service.rb
class GitlabService
  def initialize(user)
    @user = user
    @client = Gitlab.client(endpoint: 'https://gitlab.com/api/v4', private_token: @user.gitlab_token)
  end

  def fetch_projects
    @client.projects(membership: true)
  end

  def import_project(project)
    new_project = @user.projects.create!(
      title: project.name,
      description: project.description,
      source: 'gitlab',
      source_url: project.web_url
    )
    new_project
  end
end
