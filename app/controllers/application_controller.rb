class ApplicationController < ActionController::API
  rescue_from StandardError, with: :handle_error

  def respond
    render :json => {
             message: @message || "OK",
             status_code: @status_code || 200,
             data: @data,
           },
           :status => @status_code
    @message = nil
    @data = nil
    @status_code = nil
  end

  def handle_error(e)
    @message = "Error"
    @status_code = 500
    @data = e.message
    respond
  end
end
