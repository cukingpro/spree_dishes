module Spree
  module Api
    class TimeFramesController < Spree::Api::BaseController

    	skip_before_action :authenticate_user

    	def index
    		@time_frames = Dish::TimeFrame.all
    		render "spree/api/time_frames/index"
    	end

    end
  end
end
