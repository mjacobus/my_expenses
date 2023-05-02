# frozen_string_literal: true

Rails.application.routes.draw do
  draw(:social_login)

  root 'home#index'

  get '*path', to: 'frontend#index'
end
