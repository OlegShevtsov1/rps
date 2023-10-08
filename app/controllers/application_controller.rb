class ApplicationController < ActionController::API
  rescue_from Errors::V1::CustomError do |e|
    respond_to_error(e.error, e.message.to_s)
  end

  private

  def respond_to_error(error, message)
    log_error(error, message)

    render json: Errors::V1::Render.json(error, message), status: error
  end

  def log_error(error, message)
    logger.error "API V1 Error: #{error}  Message: #{message}"
  end

  def data_payload(data)
    { data: data }
  end
end
