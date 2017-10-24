class ApiController < ActionController::API

  def response_data data , status

    render json: data , status: status

  end


end
