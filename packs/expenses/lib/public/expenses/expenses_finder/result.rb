# frozen_string_literal: true

module Expenses
  class ExpensesFinder
    class Result
      attr_reader :data
      attr_reader :total_records
      attr_reader :limit

      def initialize(data, total_records:, limit:)
        @data = data
        @total_records = total_records
        @limit = limit
      end
    end
  end
end
