# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expenses::Expense do
  subject(:expense) { described_class.new(attributes) }

  let(:attributes) do
    {
      description: 'Some Expense',
      amount: '2000',
      created_at: 1.year.ago,
      updated_at: 1.year.ago + 5.minutes
    }
  end

  it 'has a description' do
    expect(expense.description).to eq('Some Expense')
  end

  it 'has a amount' do
    expect(expense.amount).to eq(2000)
  end

  it 'has a created_at' do
    freeze_time do
      expect(expense.created_at).to eq(1.year.ago.to_time)
    end
  end

  it 'has a updated_at' do
    expect(expense.updated_at).to be_a(Time)
  end
end
