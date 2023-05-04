# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Db::Expense do
  subject(:expense) { Fabricate.build(:expense) }

  it 'has a valid fabric' do
    expect(expense).to be_valid
  end

  it 'validates presence of description' do
    expense.description = nil

    expect(expense).not_to be_valid
  end

  it 'validates presence of amount' do
    expense.amount = nil

    expect(expense).not_to be_valid
  end

  it 'validates presence of expensed_at' do
    expense.expensed_at = nil

    expect(expense).not_to be_valid
  end
end
