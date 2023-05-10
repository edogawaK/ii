class ApplicationController < ActionController::API
  rescue_from StandardError, with: :handle_error

  def respond(message: "OK", status_code: 200, data: nil)
    render json: {
             message: message,
             status_code: status_code,
             data: data,
           },
           :status => status_code
  end

  def handle_error(e)
    respond(message: "Error", status_code: 500, data: e.message)
  end
end
