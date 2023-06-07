# frozen_string_literal: true

class Api::ExpensesController < Api::Controller
  def index
    respond_with_endpoint(
      Api::Expenses::IndexEndpoint.new(actor: current_user)
    )
  end
end
