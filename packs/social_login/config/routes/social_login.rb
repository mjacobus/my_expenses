if Rails.env.development?
  get '/dev/login', to: 'development#login'
end

get '/auth/:provider/callback', to: 'sessions#create'
get 'logout', to: 'sessions#destroy'
