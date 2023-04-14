# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  HelloWorldController
  get '/hello-world', to: "hello_world#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
