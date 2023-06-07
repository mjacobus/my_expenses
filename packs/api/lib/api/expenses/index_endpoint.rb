# frozen_string_literal: true

module Api
  module Expenses
    class IndexEndpoint < Endpoint
      def create_response(request:) # rubocop:disable Lint/UnusedMethodArgument
        # query = ExpensesQuery.new
        #   .bellonging_to(actor)
        #   .with_labels(request.params[:labels])
        #   .without_lables(request.params[:not_labels])
        #   .from(request.params[:from])
        #   .to(request.params[:to])
        #
        # expenses = ExpensesGatewayService.new.find_by_query(query)
        # data = DataSerializer.new(expenses)
        # JsonResponse.new(data)

        data = Db::Expense.where(user_id: actor.id)
        JsonResponse.new({ data: data })
      end
    end
  end
end
