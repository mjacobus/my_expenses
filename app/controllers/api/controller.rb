# frozen_string_literal: true

class Api::Controller < ApplicationController
  include UserSessions::ControllerMethods

  rescue_from ActiveRecord::RecordNotFound, with: :render_page404

  private

  def render_page404(_error)
    head status: 404
  end

  def require_authorization
    unless current_user
      head status: 401
    end
  end
end
