# app/controllers/activities_controller.rb
class ActivitiesController < ApplicationController
  load_and_authorize_resource

  def index
    @activities = Activity.order(created_at: :desc)
  end
end
