class ApiController < ActionController::API

  def response_data data , status

    data = {
      data: data
    }


    render json: data , status: status

  end


end
