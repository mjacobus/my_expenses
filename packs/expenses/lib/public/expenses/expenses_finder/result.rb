# frozen_string_literal: true

module Expenses
  class ExpensesFinder
    class Result
      attr_reader :data
      attr_reader :total

      def initialize(data, total)
        @data = data
        @total = total
      end
    end
  end
end
