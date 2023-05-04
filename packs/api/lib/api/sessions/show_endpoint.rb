# frozen_string_literal: true

module Api
  module Sessions
    class ShowEndpoint < Endpoint
      def create_response(request:) # rubocop:disable Lint/UnusedMethodArgument
        data = {
          name: actor.name,
          email: actor.email,
          avatar: actor.avatar
        }
        JsonResponse.new(data)
      end
    end
  end
end
