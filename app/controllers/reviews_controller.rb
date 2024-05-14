# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  load_and_authorize_resource

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_to @review.snippet, notice: 'Recensione aggiunta con successo.'
    else
      redirect_to @review.snippet, alert: 'Errore nell\'aggiunta della recensione.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :snippet_id)
  end
end
