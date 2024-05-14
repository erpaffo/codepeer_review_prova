require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      activity = create(:activity)
      get :index
      expect(response).to be_successful
    end
  end
end
