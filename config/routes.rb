# frozen_string_literal: true

Rails.application.routes.draw do
  draw(:social_login)
  draw(:api_routes)

  root 'frontend#index'
  get '*path', to: 'frontend#index'
end
