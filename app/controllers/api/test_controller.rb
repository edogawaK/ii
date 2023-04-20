class Api::TestController < ApplicationController
  def index
    @data = { params: params, class: params.class }
    respond
  end
end
