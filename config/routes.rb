# frozen_string_literal: true

Rails.application.routes.draw do
  draw(:social_login)

  root 'frontend#index'

  namespace :api, format: :json do
    resource :session, only: [:show]
  end

  get '*path', to: 'frontend#index'
end
