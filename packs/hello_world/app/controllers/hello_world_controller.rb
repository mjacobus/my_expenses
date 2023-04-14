# frozen_string_literal: true

class HelloWorldController < ApplicationController
  def index
    render plain: "Hello world from #{self.class}"
  end
end
