# frozen_string_literal: true

module EndpointSpecHelper
  extend ActiveSupport::Concern

  included do
    subject(:endpoint) { described_class.new(actor: user) }

    let(:user) { Fabricate(:user) }
    let(:request) { ActionDispatch::TestRequest.create }
    let(:response) { endpoint.create_response(request: request) }
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
  end
end
