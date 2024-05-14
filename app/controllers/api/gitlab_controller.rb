class Api::GitlabController < ApplicationController
  def index
    service = GitlabService.new(current_user)
    @projects = service.fetch_projects
  end

  def import
    service = GitlabService.new(current_user)
    project = service.fetch_projects.find { |p| p.id == params[:id].to_i }
    if project
      new_project = service.import_project(project)
      redirect_to new_project, notice: 'Progetto importato con successo da GitLab.'
    else
      redirect_to dashboard_path, alert: 'Errore nell\'importazione del progetto.'
    end
  end
end
