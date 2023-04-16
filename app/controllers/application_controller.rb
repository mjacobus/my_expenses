# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Controllers::Concerns::SocialLoginMethods

  rescue_from ActiveRecord::RecordNotFound, with: :render_page404

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
    if respond_to?(:show)
      flash.now[:error] = t('app.messages.cannot_delete_record')
      next show
    end

    raise exception
  end

  private

  def render_page404(_error)
    render 'application/404', status: :not_found
  end
end
