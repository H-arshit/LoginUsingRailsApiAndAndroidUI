Rails.application.routes.draw do

  namespace  :api do
    namespace :v1 do

          post "signin" => "signin#signin"
          post "signup" => "signin#signup"
    end
  end



end
