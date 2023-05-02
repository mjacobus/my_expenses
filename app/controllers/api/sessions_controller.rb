# frozen_string_literal: true

class Api::SessionsController < Api::Controller
  def show
    render json: {
      name: current_user.name,
      email: current_user.email,
      avatar: current_user.avatar
    }
  end
end