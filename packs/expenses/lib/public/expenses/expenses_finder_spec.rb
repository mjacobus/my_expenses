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
      expect(result.total_records).to eq(1)
      expect(result.limit).to eq(100)
    end

    it 'filters expenses by from_date' do
      travel_to(Time.zone.local(2020, 10, 1)) do
        expected = Fabricate(:expense, expensed_at: 1.day.from_now)
        _other = Fabricate(:expense, expensed_at: 3.days.ago)

        query = base.with_from_date('2020-10-01 00:00:00')

        result = finder.by_query(query)

        expect(result.total_records).to eq(1)
        expect(result.data).to be_equal_to([from_ar(expected)])
      end
    end

    it 'filters expenses by to_date' do
      travel_to(Time.zone.local(2020, 10, 1)) do
        expected = Fabricate(:expense, expensed_at: 1.day.ago)
        _other = Fabricate(:expense, expensed_at: 3.days.from_now)

        query = base.with_to_date('2020-10-01 00:00:00')

        result = finder.by_query(query)

        expect(result.total_records).to eq(1)
        expect(result.data).to be_equal_to([from_ar(expected)])
      end
    end
  end

  def from_ar(record)
    attributes = %i[id description expensed_at amount created_at updated_at]
    Expenses::Expense.new(record.attributes.symbolize_keys.slice(*attributes))
  end
end
