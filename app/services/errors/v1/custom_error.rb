module Errors
  module V1
    class CustomError < StandardError
      attr_reader :error, :message

      def initialize(_error = nil, _message = nil)
        @error = _error || 422
        @message = _message || 'Something went wrong'
      end

      def as_json(*)
        {
          error: error,
          message: message
        }.as_json
      end

      def fetch_json
        Helpers::Render.json(error, message)
      end
    end

      class Render
        def self.json(_error, _message)
          {
            message: _message
          }.as_json
        end
      end
  end
end
