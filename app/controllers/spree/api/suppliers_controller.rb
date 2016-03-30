module Spree
  module Api
    class SuppliersController < Spree::Api::BaseController

      skip_before_action :authenticate_user

      def index
        @suppliers = Dish::Supplier.all
        render "spree/api/suppliers/index"
      end

    end
  end
end
