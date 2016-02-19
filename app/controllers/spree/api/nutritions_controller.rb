module Spree
  module Api
    class NutritionsController	< Spree::Api::BaseController

      before_action :authenticate_user, :except => [:index, :show]
      def index
        if params[:product_id]
          @products_nutritions = Spree::Product.find(params[:product_id]).products_nutritions
          # @nutritions = Spree::Product.find(params[:product_id]).nutritions
          render "spree/api/nutritions/products_nutritions"
        else
          @nutritions = Dish::Nutrition.all
          render "spree/api/nutritions/index"
        end

        
      end

      def show
        @nutrition = Dish::Nutrition.find(params[:id])
        render "spree/api/nutritions/show"
      end

      def create
        authorize! :create, Dish::Nutrition
        Dish::Nutrition.create(nutrition_params)
        @status = [ { "messages" => "Add Nutrition Successful"}]
        render "spree/api/logger/log", status: 201
      end

      def update
        @nutritions = Dish::Nutrition.find(params[:id])
        authorize! :update, @nutrition

        @nutritions.update(nutrition_params)

        @status = [ { "messages" => "Update Nutrition Successful"}]
        render "spree/api/logger/log", status: 201

      end

      def destroy
        @nutritions = Dish::Nutrition.find(params[:id])
        authorize! :destroy, @nutrition
        @nutritions.destroy

        @status = [ { "messages" => "Delete Nutrition Successful"}]
        render "spree/api/logger/log", status: 204
      end

      private

      def nutrition_params
        params.require(:nutrition).permit(:name, :description)
      end

    end
  end
end