module Api

    module V1

      class SigninController < ApiController

          def signin

              email = params[:email]
              password = params[:password]

              if User.where(email: email).first

                    if User.where(email: email , password: password).first

                        data={}
                        data[:message] = "Success"
                        data[:email] = email
                        data[:auth_token] = User.where(email: email , password: password).first["auth_token"]
                        data[:isvalid] = true
                        return response_data data , 200

                    else

                       data={}
                       data[:message] = "Failed"
                       data[:isvalid] = false
                       return response_data data , 200


                    end


              else

                      data={}
                      data[:message] = "User Not Present"
                      data[:isvalid] = false

                return response_data data , 200
              end

          end



          def signup
            email = params[:email]
            password = params[:password]
            phone_no = params[:phone_no]


            if User.where(email: email).first

              data={}
              data[:message] = "Account Already Exists"
              data[:isvalid] = false
              return response_data data, 200


            else

              auth_token = SecureRandom.hex
              User.create(email: email , password: password , phone_no: phone_no ,auth_token: auth_token )
              data = {}
              data[:message] = "New User Created"
              data[:email] = email
              data[:auth_token] = auth_token
              data[:isvalid] = true

              return response_data data , 200

            end






          end


      end



    end


end
