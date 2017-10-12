module Api

    module v1

      class SigninController < ApiController

          def signin email,password

              if User.where(email: email)

                    if User.where(email: email , password: password)

                        data={}
                        data[:message] = "success"
                        data[:email] = email
                        data[:auth_token] = User.where(email: email , password: password).auth_token

                        return response_data data , true

                    else

                      data={}
                      data[:message] = "failure"

                      return response_data data , false


                    end


              else

                data={}
                data[:message] = "not present"
                return response_data data , false
              end

          end



          def signup email , password , phone_no

            unless User.where(email: email , password: password).first

                auth_token = SecureRandom.hex
                
               User.create(email: email , password: password , phone_no: phone_no ,auth_token: auth_token )

              data = {}
              data[:message] = "new user"
              data[:email] = email
              data[:auth_token] = auth_token

              return response_data data , true

            end


            return response_data nil, false


          end


      end



    end


end
