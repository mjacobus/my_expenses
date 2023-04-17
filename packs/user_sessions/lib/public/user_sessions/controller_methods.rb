# frozen_string_literal: true

module UserSessions
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      before_action :require_authorization
      helper_method :current_user
    end

    private

    def require_authorization
      unless current_user
        redirect_to('/', flash: { error: 'Access Denied' })
      end
    end

    def current_user
      if defined?(@current_user)
        return @current_user
      end

      @current_user ||= UserSessionService.new(session: session).current_user
    end
  end
end
