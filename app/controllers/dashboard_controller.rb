# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Aggiungi qui la logica per recuperare i dati della dashboard, se necessario
  end
end
