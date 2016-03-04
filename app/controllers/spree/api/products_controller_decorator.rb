Spree::Api::ProductsController.class_eval do

  before_action :authenticate_user, :except => [:index, :show, :duration, :full]
  def index
    
    @user_id = request.headers["X-Spree-Token"].present? ? current_api_user.id : nil;
    
    if params[:dish_type_id]
    	#@products = Spree::Product.where(dish_type_id: params[:dish_type_id])
      @products = Dish::DishType.find(params[:dish_type_id]).products
    else
      @products = Spree::Product.all.ransack(params[:q]).result
    end
    render "spree/api/products/index", status: 200
  end

  def show
    @user_id = request.headers["X-Spree-Token"].present? ? current_api_user.id : nil;
    @product = Spree::Product.find(params[:id])
    p 1111111111111111111
    p @product.likes
    p 2222222222222222222
    p @product.likes.count
    p 111111111111111111111
    render "spree/api/products/show", status: 200
  end
end