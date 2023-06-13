# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expenses::ExpensesFinder do
  subject(:finder) { described_class.new }

  describe '#by_query' do
    let(:base) { Expenses::ExpensesQuery.new }

    it 'filters expenses by owner' do
      owner = Fabricate(:user)
      expected = Fabricate(:expense, user: owner)
      _other = Fabricate(:expense)

      query = base.with_owner_id(owner.id)

      result = finder.by_query(query)

      expect(result.data).to be_equal_to([from_ar(expected)])
      expect(result.total).to eq(1)
    end
  end

  def from_ar(record)
    attributes = %i[id description amount created_at updated_at]
    Expenses::Expense.new(record.attributes.symbolize_keys.slice(*attributes))
  end
end
