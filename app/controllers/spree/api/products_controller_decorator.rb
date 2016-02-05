Spree::Api::ProductsController.class_eval do

  before_action :authenticate_user, :except => [:index, :show, :duration, :full]
  def index
    
    if params[:dish_type_id]
    	#@products = Spree::Product.where(dish_type_id: params[:dish_type_id])
      @products = Dish::DishType.find(params[:dish_type_id]).products
    else
      @products = Spree::Product.all.ransack(params[:q]).result
    end
    render "spree/api/products/index", status: 200
  end

  def show
    @product = Spree::Product.find(params[:id])
    render "spree/api/products/show"
  end
end