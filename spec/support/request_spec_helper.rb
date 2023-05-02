# frozen_string_literal: true

module RequestSpecHelper
  extend ActiveSupport::Concern

  def sign_in(user)
    allow_any_instance_of(described_class).to receive(:current_user).and_return(user)
  end

  included do
    let(:user) { Fabricate(:user) }
    let(:json_response) { JSON.parse(response.body, symbolize_names: true) }
  end
end
