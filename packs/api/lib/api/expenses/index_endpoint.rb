# frozen_string_literal: true

module Api
  module Expenses
    class IndexEndpoint < Endpoint
      def initialize(actor:, finder: ::Expenses::ExpensesFinder.new)
        super(actor: actor)
        @finder = finder
      end

      def create_response(request:) # rubocop:disable Metrics/AbcSize
        query = ::Expenses::ExpensesQuery.new
          .with_owner_id(actor.id)
          .with_from_date(request.params[:from])
          .with_to_date(request.params[:to])
          .with_limit(request.params[:limit])
          .with_page(request.params[:page])

        result = @finder.by_query(query)

        IndexResponse.new(finder_result: result)
      end
    end
  end
end
