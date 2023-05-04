# frozen_string_literal: true

namespace :api, format: :json do
  resource :session, only: [:show]
end
