# frozen_string_literal: true

module Expenses
  class ExpensesFinder
    class Result
      attr_reader :data
      attr_reader :count
      attr_reader :limit
      attr_reader :page

      def initialize(data, count:, limit:, page:)
        @data = data
        @count = count
        @limit = limit
        @page = page
      end
    end
  end
end
