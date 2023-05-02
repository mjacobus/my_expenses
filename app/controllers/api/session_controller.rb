# frozen_string_literal: true

class Api::SessionController < Api::Controller
  include UserSessions::ControllerMethods

  rescue_from ActiveRecord::RecordNotFound, with: :render_page404

  def show
    render json: { ok: true }
  end

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
