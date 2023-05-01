class FrontendController < ApplicationController
  skip_before_action :require_authorization

  def index
    # paths = Dir[Rails.root.join('dist/index.*.js')]
    # render json: paths
  end
end
