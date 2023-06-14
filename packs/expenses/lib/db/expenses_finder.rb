# frozen_string_literal: true

module Db
  class ExpensesFinder
    def initialize(scope = Expense.all)
      @scope = scope
    end

    def with_user_id(user_id)
      new(scope.where(user_id: user_id))
    end

    def with_expensed_at_from(date)
      new(scope.where('expensed_at >= ?', date))
    end

    def with_expensed_at_to(date)
      new(scope.where('expensed_at <= ?', date))
    end

    def with_limit(limit)
      new(scope.limit(limit))
    end

    def with_offset(offset)
      new(scope.offset(offset))
    end

    def to_a
      ArPlucker.new.pluck(scope, fields: fields)
    end

    delegate :count, to: :scope

    private

    attr_reader :scope

    def new(scope)
      self.class.new(scope)
    end

    def fields
      %i[id description amount expensed_at created_at updated_at]
    end
  end
end
