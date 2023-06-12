# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expenses::ArPlucker do
  subject(:plucker) { described_class.new }

  let(:query) { Db::User.limit(1) }

  it 'maps to hashes' do
    user = Fabricate(:user)

    plucked = plucker.pluck(query, fields: %i[id created_at])

    expect(plucked).to eq(
      [
        id: user.id,
        created_at: user.created_at
      ]
    )
  end
end
