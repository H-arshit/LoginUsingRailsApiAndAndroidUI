module Api

    module V1

        class FestivalController < ApiController

            def getallfestivals
              @festivals = Festival.all

              return response_data @festivals, 200
            end


      end
    end
end
