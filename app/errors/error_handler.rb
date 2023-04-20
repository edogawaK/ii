module Error
  def raise_error(error_code)
    error = ERRORS[error_code]
    raise new StandardError error
  end

  def respond_error(error)
    render json: {
      message: error.message,
      statusCode: error.status_code,
    }
  end

  ERRORS = {
    INTERNAL: { message: "Internal Error", status_code: 500 },
    NOT_FOUND: { message: "Not Found Error", status_code: 404 },
    USER_EXISTED: { message: "Username Is Existed", status_code: 400 },
    NOT_FOUND: { message: "Not Found Error", status_code: 404 },
  }
end
