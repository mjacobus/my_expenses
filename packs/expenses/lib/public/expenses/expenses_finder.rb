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

    def by_query(query)
      finder = Db::ExpensesFinder.new
      finder = finder.with_user_id(query.owner_id)
      data = finder.to_a.map { |attrs| Expense.new(attrs) }
      Result.new(data, finder.count)
    end
  end
end
