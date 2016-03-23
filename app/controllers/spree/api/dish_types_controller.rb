module Spree
  module Api
    class DishTypesController < Spree::Api::BaseController
      before_action :authenticate_user, :except => [:index, :show]

      def index
        @dish_types = Dish::DishType.all

        render "spree/api/dish_types/index"
      end

      def show
        @dish_type = Dish::DishType.find(params[:id])
        render "spree/api/dish_types/show"
      end

      def create
        authorize! :create, Dish::DishType
        Dish::DishType.create(dish_type_params)
        @status = [ { "messages" => "Add Dish Type Successful"}]
        render "spree/api/logger/log", status: 201
      end

      def update
        @dish_type = Dish::DishType.find(params[:id])
        authorize! :update, @dish_type

        @dish_type.update(dish_type_params)

        @status = [ { "messages" => "Update Dish Type Successful"}]
        render "spree/api/logger/log", status: 201

      end

      def destroy
        @dish_type = Dish::DishType.find(params[:id])
        authorize! :destroy, @dish_type
        @dish_type.destroy

        @status = [ { "messages" => "Delete Dish Type Successful"}]
        render "spree/api/logger/log", status: 204
      end

      private

      def dish_type_params
        params.require(:dish_type).permit(:name, :description, :is_active)
      end

    end
  end
end
