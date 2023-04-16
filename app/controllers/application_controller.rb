# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_authorization
  helper_method :current_user

  layout :layout

  rescue_from ActiveRecord::RecordNotFound, with: :render_page404

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
    if respond_to?(:show)
      flash.now[:error] = t('app.messages.cannot_delete_record')
      next show
    end

    raise exception
  end

  private

  def require_authorization
    unless current_user
      redirect_to('/', flash: { error: "Access Denied" })
    end
  end

  def current_account
    @current_account ||= current_user.account
  end

  def current_user
    if defined?(@current_user)
      return @current_user
    end

    @current_user ||= UserSessionService.new(session: session).current_user
  end

  def render_page404(_error)
    render 'application/404', status: :not_found
  end
end
