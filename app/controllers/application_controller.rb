# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include UserSessions::ControllerMethods

  rescue_from ActiveRecord::RecordNotFound, with: :render_page404

  private

  def render_page404(_error)
    render 'application/404', status: :not_found
  end
end
