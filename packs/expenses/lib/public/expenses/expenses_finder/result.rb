# frozen_string_literal: true

module Expenses
  class ExpensesFinder
    class Result
      attr_reader :data
      attr_reader :total_records
      attr_reader :limit
      attr_reader :page

      def initialize(data, total_records:, limit:, page:)
        @data = data
        @total_records = total_records
        @limit = limit
        @page = page
      end
    end
  end
end
