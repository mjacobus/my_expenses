# frozen_string_literal: true

module UserSessions
  class DevSessionsController < ApplicationController
    skip_before_action :require_authorization

    def login
      session['user_id'] = params[:id] || Db::User.first.id
      redirect_to('/')
    end
  end
end
