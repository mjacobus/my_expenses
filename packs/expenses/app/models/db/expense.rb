# frozen_string_literal: true

class Db::Expense < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :amount, presence: true
  validates :expensed_at, presence: true
end
