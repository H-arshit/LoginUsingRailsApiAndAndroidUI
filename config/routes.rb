Rails.application.routes.draw do

  namespace  :api do
    namespace :v1 do

          post "signin" => "signin#signin"
          post "signup" => "signin#signup"
          post "resetpswd" => "signin#resetpswd"
          post "userimage" => "signin#userimage"


    end
  end



end
