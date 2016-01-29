module Spree
  module Api
    class DishTypesController < Spree::Api::BaseController
      	before_action :authenticate_user, :except => [:index]
      	def index
				@dish_types = Dish::DishType.all
				#render json: @dish_types
				render "spree/api/dish_types/index"
		    end		    
    end    
  end
end