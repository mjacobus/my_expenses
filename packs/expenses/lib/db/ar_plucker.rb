# frozen_string_literal: true

module Db
  class ArPlucker
    def pluck(query, fields: [])
      data = query.pluck(*fields)
      data.map do |values|
        map(values, fields)
      end
    end

    private

    def map(values, fields)
      values.map.with_index do |value, index|
        [fields[index], value]
      end.to_h
    end
  end
end
