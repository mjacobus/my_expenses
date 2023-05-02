# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SessionsController do
  describe 'GET /index' do
    context 'when user is logged in' do
      before do
        sign_in(user)
      end

      it 'returns suser information' do
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
    end
  end
end
