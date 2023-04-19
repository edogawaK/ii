module Utils
  def respond(response)
    puts "respond"
    render :json => { data: response[:data], statusCode: response[:status_code], message: response[:message] }
  end
end
