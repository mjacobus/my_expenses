# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  draw(:hello_world)
  draw(:social_login)

  root "hello_world#index"
end
