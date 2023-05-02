# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SessionsController do
  describe 'GET /index' do
    it 'returns suser information when user is logged in' do
      sign_in(user)

      get '/api/session'

      expect(response).to be_successful
      expect(json_response).to eq(
        {
          name: user.name,
          email: user.email,
          avatar: user.avatar
        }
      )
    end

    it 'responds with 401 when user is not logge din' do
      get '/api/session'

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
