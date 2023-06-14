# frozen_string_literal: true

module Api
  module Expenses
    class IndexResponse < JsonResponse
      def initialize(finder_result:)
        @finder_result = finder_result
      end

      def data
        @data ||= format_response(@finder_result)
      end

      private

      def format_response(finder_response)
        {
          meta: {
            count: finder_response.count,
            limit: finder_response.limit,
            page: finder_response.page
          },
          data: finder_response.data.map do |expense|
            to_hash(expense)
          end
        }
      end

      def to_hash(expense)
        {
          id: expense.id,
          description: expense.description,
          amount: expense.amount,
          expensed_at: expense.expensed_at,
          created_at: expense.created_at,
          updated_at: expense.updated_at
        }
      end
    end
  end
end
