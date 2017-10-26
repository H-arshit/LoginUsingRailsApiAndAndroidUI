Rails.application.routes.draw do

  get 'app_functionality/index'

  namespace  :api do
    namespace :v1 do

          post "signin" => "signin#signin"
          post "signup" => "signin#signup"
          post "resetpswd" => "signin#resetpswd"
          post "userimage" => "signin#userimage"
          get "getallfestivals" => "festival#getallfestivals"


    end
  end



end
