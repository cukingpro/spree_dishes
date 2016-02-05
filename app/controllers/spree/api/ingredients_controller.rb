module Spree
  module Api
    class IngredientsController	< Spree::Api::BaseController

      before_action :authenticate_user, :except => [:index, :show]
      def index
        if params[:product_id]
          @ingredients = Spree::Product.find(params[:product_id]).ingredients
        else
          @ingredients = Dish::Ingredient.all
        end

        render "spree/api/ingredients/index"
      end

      def show
        @ingredient = Dish::Ingredient.find(params[:id])
        render "spree/api/ingredients/show"
      end

      def create
        authorize! :create, Dish::Ingredient
        Dish::Ingredient.create(ingredient_params)
        @status = [ { "messages" => "Add Ingredient Successful"}]
        render "spree/api/logger/log", status: 201
      end

      def update
        @ingredient = Dish::Ingredient.find(params[:id])
        authorize! :update, @ingredient

        @ingredient.update(ingredient_params)

        @status = [ { "messages" => "Update Ingredient Successful"}]
        render "spree/api/logger/log", status: 201

      end

      def destroy
        @ingredient = Dish::Ingredient.find(params[:id])
        authorize! :destroy, @ingredient
        @ingredient.destroy

        @status = [ { "messages" => "Delete Ingredient Successful"}]
        render "spree/api/logger/log", status: 204
      end

      private

      def ingredient_params
        params.require(:ingredient).permit(:name, :description)
      end

    end
  end
end