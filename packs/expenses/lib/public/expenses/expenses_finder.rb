# frozen_string_literal: true

module Expenses
  class ExpensesFinder
    def initialize(db_finder: Db::ExpensesFinder.new)
      @db_finder = db_finder
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def by_query(query)
      finder = @db_finder.with_limit(query.limit).with_offset(query.offset)

      if query.owner_id
        finder = finder.with_user_id(query.owner_id)
      end

      if query.from_date
        finder = finder.with_expensed_at_from(query.from_date)
      end

      if query.to_date
        finder = finder.with_expensed_at_to(query.to_date)
      end

      data = finder.to_a.map { |attrs| Expense.new(attrs) }
      Result.new(data, finder.count)
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
