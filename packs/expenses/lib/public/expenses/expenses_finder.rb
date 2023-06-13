# frozen_string_literal: true

module Expenses
  class ExpensesFinder
    def initialize(db_finder: Db::ExpensesFinder.new)
      @db_finder = db_finder
    end

    def by_query(query) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      finder = @db_finder

      if query.owner_id
        finder = finder.with_user_id(query.owner_id)
      end

      if query.from_date
        finder = finder.with_expensed_at_from(query.from_date)
      end

      if query.to_date
        finder = finder.with_expensed_at_to(query.to_date)
      end

      limited_data = finder.with_limit(query.limit).with_offset(query.offset)
      data = limited_data.to_a.map { |attrs| Expense.new(attrs) }
      Result.new(data, total_records: finder.count, limit: query.limit)
    end
  end
end
