Spree::Api::ProductsController.class_eval do

  before_action :authenticate_user, :except => [:index, :show, :search_by_name]
  def index

    # @user_id = request.headers["X-Spree-Token"].present? ? current_api_user.id : nil;

    if params[:dish_type_id]
      #@products = Spree::Product.where(dish_type_id: params[:dish_type_id])
      @products = Dish::DishType.find(params[:dish_type_id]).products
    else
      @products = Spree::Product.all.ransack(params[:q]).result
    end
    render "spree/api/products/index", status: 200
  end

  def show
    # @user_id = request.headers["X-Spree-Token"].present? ? current_api_user.id : nil;
    
    @product = Spree::Product.find(params[:id])

    render "spree/api/products/show", status: 200
  end

  def search_by_name
    @products = Spree::Product.ransack(name_cont: params[:name]).result
    render "spree/api/products/index", status: 200
  end
end
