# frozen_string_literal: true

class Api::Controller < ActionController::Base # rubocop:disable Rails/ApplicationController
  include UserSessions::ControllerMethods

  rescue_from ActiveRecord::RecordNotFound, with: :render_page404

  private

  def render_page404(_error)
    head :not_found
  end

  def require_authorization
    unless current_user
      head :unauthorized
    end
  end
end
