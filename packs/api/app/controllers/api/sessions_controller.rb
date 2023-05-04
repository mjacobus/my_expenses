# frozen_string_literal: true

class Api::SessionsController < Api::Controller
  def show
    respond_with_endpoint(
      Api::Sessions::ShowEndpoint.new(actor: current_user)
    )
  end
end
