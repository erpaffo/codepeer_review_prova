# app/controllers/projects_controller.rb
class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'Progetto creato con successo.'
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
