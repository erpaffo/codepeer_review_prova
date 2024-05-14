require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new review' do
        user = create(:user)
        snippet = create(:snippet, user: user)
        sign_in user

        expect {
          post :create, params: { review: { rating: 4, comment: 'Well done!', snippet_id: snippet.id } }
        }.to change(Review, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new review' do
        user = create(:user)
        snippet = create(:snippet, user: user)
        sign_in user

        expect {
          post :create, params: { review: { rating: nil, comment: '', snippet_id: snippet.id } }
        }.to_not change(Review, :count)
      end
    end
  end
end
