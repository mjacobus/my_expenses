# frozen_string_literal: true

module Db
  class ExpensesFinder
    def initialize(scope = Expense.all)
      @scope = scope
    end

    def with_user_id(user_id)
      new(scope.where(user_id: user_id))
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
      %i[id description amount created_at updated_at]
    end
  end
end
