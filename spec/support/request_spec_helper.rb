# frozen_string_literal: true

module RequestSpecHelper
  extend ActiveSupport::Concern

  def sign_in(user)
    allow_any_instance_of(described_class).to receive(:current_user).and_return(user)
  end

  included do
    let(:user) { Fabricate(:user) }
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
    let(:mock_endpoint) { instance_double(Api::Endpoint) }
    let(:mock_endpoint_response) { Api::JsonResponse.new('ok') }
  end

  def stub_endpoint(endpoint_class)
    allow(endpoint_class).to receive(:new).and_return(mock_endpoint)
    allow(mock_endpoint).to receive(:create_response)
      .with(request: instance_of(ActionDispatch::Request))
      .and_return(mock_endpoint_response)
  end
end
