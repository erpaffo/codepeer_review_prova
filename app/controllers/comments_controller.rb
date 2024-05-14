# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @comment.snippet, notice: 'Commento aggiunto con successo.'
    else
      redirect_to @comment.snippet, alert: 'Errore nell\'aggiunta del commento.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :snippet_id)
  end
end
