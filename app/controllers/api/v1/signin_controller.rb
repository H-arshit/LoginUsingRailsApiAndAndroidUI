module Api

    module V1

      class SigninController < ApiController


        def userimage

          content = params[:image]
          content.gsub!('\\r', "\r")
          content.gsub!('\\n', "\n")
          decode_base64_content = Base64.decode64(content)



              filename = SecureRandom.hex + ".png"
              filepath = Dir.pwd + "/public/userimage/" + filename

              File.open(filepath,'wb') do |file|
              file.write(decode_base64_content)
              end

              userimage  =  User.where(email: params[:email] , auth_token: params[:auth_token]).first
              userimage.image = "/userimage/" + filename
              if userimage.save!

                data={}
                data[:message] = "Successful"
                data[:isvalid] = true
                return response_data data, 200


              else

              data={}
              data[:message] = "Failed"
              data[:isvalid] = false
              return response_data data, 200

            end


            end



          def resetpswd




            email = params[:email]
            password = params[:password]
            phone_no = params[:phone_no]


            if User.where(email: email , phone_no: phone_no).first

              user_data = User.where(email: email , phone_no: phone_no).first
              user_data.password = password
              user_data.save!


              data={}
              data[:message] = "Update Password Successful"
              data[:isvalid] = true
              return response_data data, 200


            else
              data={}
              data[:message] = "No Recoed Match"
              data[:isvalid] = false
              return response_data data, 200



            end



          end


          def signin

              email = params[:email]
              password = params[:password]

              if User.where(email: email).first

                    if User.where(email: email , password: password).first

                        data={}
                        data[:name] = User.where(email: email , password: password).name
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
            name = params[:name]

            if User.where(email: email).first

              data={}
              data[:message] = "Account Already Exists"
              data[:isvalid] = false
              return response_data data, 200


            else

              auth_token = SecureRandom.hex
              User.create(email: email , password: password , phone_no: phone_no ,auth_token: auth_token , name: name)
              data = {}
              data[:message] = "New User Created"
              data[:email] = email
              data[:auth_token] = auth_token
              data[:name] = name
              data[:isvalid] = true

              return response_data data , 200

            end

          end


      end



    end


end
