# app/controllers/snippets_controller.rb
class SnippetsController < ApplicationController
  load_and_authorize_resource

  def index
    @snippets = Snippet.all
  end

  def show
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = current_user.snippets.build(snippet_params)
    if @snippet.save
      redirect_to @snippet, notice: 'Snippet creato con successo.'
    else
      render :new
    end
  end

  def my_snippets
    @snippets = current_user.snippets
  end

  def resume_snippet
    @snippet = current_user.snippets.last
    if @snippet
      redirect_to edit_snippet_path(@snippet)
    else
      redirect_to my_snippets_path, alert: "Non ci sono snippet da riprendere."
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :code, :language, :user_id, :project_id)
  end
end
