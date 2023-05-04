# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SessionsController do
  describe 'GET /index' do
    before do
      sign_in(user)
      stub_endpoint(Api::Sessions::ShowEndpoint)
    end

    it 'responds with the correct endpoint' do
      get '/api/session'

      expect(response).to be_successful
      expect(response.body).to eq('ok')
    end

    it 'instantiates endpoint with the correct arguments' do
      get '/api/session'

      expect(Api::Sessions::ShowEndpoint).to have_received(:new).with(actor: user)
    end

    context 'when user is not logged in' do
      let(:user) { nil }

      it 'responds with 401 when user is not logged in' do
        get '/api/session'

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
