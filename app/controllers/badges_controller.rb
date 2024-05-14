# app/controllers/badges_controller.rb
class BadgesController < ApplicationController
  load_and_authorize_resource

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to @badge, notice: 'Badge creato con successo.'
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :description)
  end
end
