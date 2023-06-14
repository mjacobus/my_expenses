# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Expenses::IndexResponse do
  subject(:response) { described_class.new(finder_result: finder_result) }

  let(:finder_result) { instance_double(Expenses::ExpensesFinder::Result) }
  let(:expense) { instance_double(Expenses::Expense) }

  before do
    allow(finder_result).to receive(:data).and_return([expense])
    allow(finder_result).to receive(:count).and_return('total-records')
    allow(finder_result).to receive(:limit).and_return('limit')
    allow(finder_result).to receive(:page).and_return('page')

    allow(expense).to receive(:id).and_return('the-id')
    allow(expense).to receive(:description).and_return('the-description')
    allow(expense).to receive(:amount).and_return('the-amount')
    allow(expense).to receive(:expensed_at).and_return('the-expensed_at')
    allow(expense).to receive(:created_at).and_return('the-created_at')
    allow(expense).to receive(:updated_at).and_return('the-updated_at')
  end

  describe '#data' do
    it 'returns an array with all expenses properties' do # rubocop:disable RSpec/ExampleLength
      expect(response.data).to eq(
        data: [
          {
            id: expense.id,
            description: expense.description,
            amount: expense.amount,
            expensed_at: expense.expensed_at,
            created_at: expense.created_at,
            updated_at: expense.updated_at
          }
        ],
        meta: {
          count: 'total-records',
          limit: 'limit',
          page: 'page'
        }
      )
    end
  end
end
