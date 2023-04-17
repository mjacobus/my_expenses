# frozen_string_literal: true

if Rails.env.development?
  get '/dev/login', to: 'development#login'
end

get '/auth/:provider/callback', to: 'user_sessions/oauth_sessions#create'
get 'logout', to: 'user_sessions/oauth_sessions#destroy'
