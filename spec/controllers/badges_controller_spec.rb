require 'rails_helper'

RSpec.describe BadgesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      badge = create(:badge)
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new badge' do
        admin = create(:user, :admin)
        sign_in admin

        expect {
          post :create, params: { badge: { name: 'Helper', description: 'Helped others' } }
        }.to change(Badge, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new badge' do
        admin = create(:user, :admin)
        sign_in admin

        expect {
          post :create, params: { badge: { name: '', description: 'Helped others' } }
        }.to_not change(Badge, :count)
      end
    end
  end
end
