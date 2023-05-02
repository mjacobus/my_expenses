# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SessionController do
  describe 'GET /index' do
    context 'when user is logged in' do
      before do
        sign_in(user)
      end

      it 'returns suser information' do
        get '/api/session'

        expect(response).to be_successful
      end
    end
  end
end
