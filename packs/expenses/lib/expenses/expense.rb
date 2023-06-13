# frozen_string_literal: true

module Expenses
  class Expense
    include Koine::Attributes

    attributes(initializer: true) do
      attribute :id, :integer
      attribute :description, :string
      attribute :amount, :integer
      attribute :created_at, :time
      attribute :updated_at, :time
    end
  end
end
