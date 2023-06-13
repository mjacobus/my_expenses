# frozen_string_literal: true

module Expenses
  class ExpensesQuery
    attr_reader :owner_id
    attr_reader :label_ids
    attr_reader :not_label_ids
    attr_reader :from_date
    attr_reader :to_date

    def initialize
      freeze
    end

    def with_owner_id(id)
      with { |q| q.owner_id = id }
    end

    def with_label_ids(ids)
      with { |q| q.label_ids = ids }
    end

    def without_label_ids(ids)
      with { |q| q.not_label_ids = ids }
    end

    def with_from_date(date)
      with { |q| q.from_date = date }
    end

    def with_to_date(date)
      with { |q| q.to_date = date }
    end

    protected

    attr_writer :owner_id
    attr_writer :label_ids
    attr_writer :not_label_ids
    attr_writer :from_date
    attr_writer :to_date

    private

    def with
      dup.tap do |obj|
        yield(obj)
        obj.freeze
      end
    end
  end
end
