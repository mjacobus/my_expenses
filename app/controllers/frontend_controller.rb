# frozen_string_literal: true

class FrontendController < ApplicationController
  skip_before_action :require_authorization
end
