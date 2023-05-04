# frozen_string_literal: true

module Api
  class JsonResponse
    attr_reader :data
    attr_reader :status
    attr_reader :headers

    def initialize(data, status: 200, headers: {})
      @data = data
      @status = status
      @headers = headers
    end
  end
end
