require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new comment' do
        user = create(:user)
        snippet = create(:snippet, user: user)
        sign_in user

        expect {
          post :create, params: { comment: { content: 'Great snippet!', snippet_id: snippet.id } }
        }.to change(Comment, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new comment' do
        user = create(:user)
        snippet = create(:snippet, user: user)
        sign_in user

        expect {
          post :create, params: { comment: { content: '', snippet_id: snippet.id } }
        }.to_not change(Comment, :count)
      end
    end
  end
end
