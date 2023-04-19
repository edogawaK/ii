class ApplicationController < ActionController::API
  def respond
    render :json => {
      message: @message || "OK",
      statusCode: @status_code || 200,
      data: @data,
    }
  end
end
