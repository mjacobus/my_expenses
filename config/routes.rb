# frozen_string_literal: true

Rails.application.routes.draw do
  draw(:hello_world)
  draw(:social_login)

  root "home#index"
end
