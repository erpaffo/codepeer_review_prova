class Api::GithubController < ApplicationController
  def index
    service = GithubService.new(current_user)
    @repositories = service.fetch_repositories
  end

  def import
    service = GithubService.new(current_user)
    repo = service.fetch_repositories.find { |r| r[:id] == params[:id].to_i }
    if repo
      project = service.import_project(repo)
      redirect_to project, notice: 'Progetto importato con successo da GitHub.'
    else
      redirect_to dashboard_path, alert: 'Errore nell\'importazione del progetto.'
    end
  end
end
