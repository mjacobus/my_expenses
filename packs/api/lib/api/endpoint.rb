# frozen_string_literal: true

module Api
  class Endpoint
    def initialize(actor:)
      @actor = actor
    end

    # @param request [ActionDispatch::Request]
    def create_response(request:)
      raise NotImplementedError
    end

    private

    attr_reader :actor
  end
end
