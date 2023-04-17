# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Db::User do
  it 'creates with a factory' do
    expect { Fabricate(:user) }.to change(described_class, :count).to(1)
  end
end
