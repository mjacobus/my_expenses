# frozen_string_literal: true

module Expenses
  class ExpensesFinder
    class Result
      attr_reader :data

      def initialize(data)
        @data = data
      end
    end

    def by_query(query)
      result = Db::Expense.where(user_id: query.owner_id)
      result = ArPlucker.new.pluck(result, fields: fields).map do |attrs|
        Expense.new(attrs)
      end

      Result.new(result)
    end

    private

    def fields
      %i[id description amount created_at updated_at]
    end
  end
end
