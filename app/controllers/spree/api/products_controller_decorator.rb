Spree::Api::ProductsController.class_eval do

  before_action :authenticate_user, :except => [:index, :show, :duration, :full]
  def index
    
    if params[:dish_type_id]
    	@products = Spree::Product.where(dish_type_id: params[:dish_type_id])
    else
      @products = Spree::Product.all.ransack(params[:q]).result
    end
    render "spree/api/products/index", status: 200
  end

  def show
    @products = Spree::Product.find(params[:id])
    render "spree/api/products/show"
  end
end