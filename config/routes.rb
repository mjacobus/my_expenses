# frozen_string_literal: true

Rails.application.routes.draw do
  draw(:social_login)

  get '*path', to: 'frontend#index'
end
