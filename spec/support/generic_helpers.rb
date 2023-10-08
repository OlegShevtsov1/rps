module Helpers
  module GenericHelpers
    def json_response
      JSON.parse @response.body if @response.body.present?
    end
  end
end
