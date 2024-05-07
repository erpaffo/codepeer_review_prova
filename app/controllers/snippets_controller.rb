class SnippetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @snippets = Snippet.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = current_user.snippets.build(snippet_params)
    if @snippet.save
      redirect_to @snippet, notice: 'Snippet was successfully created.'
    else
      render :new
    end
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :code, :language)
  end
end
