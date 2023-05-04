# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Sessions::ShowEndpoint, type: :endpoint do
  describe '#create_response' do
    it 'responds correctly' do
      expect(response.data).to eq(
        name: user.name,
        email: user.email,
        avatar: user.avatar
      )
    end
  end
end
