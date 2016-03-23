Spree::Api::ProductsController.class_eval do

  skip_before_action :authenticate_user

  def index
    if params[:dish_type_id]
      @products = Dish::DishType.find(params[:dish_type_id]).products
    else
      @products = Spree::Product.all.ransack(params[:q]).result
    end
    render "spree/api/products/index", status: 200
  end

  def index2
    @abc = Spree::Product.products_in_week
    render "spree/api/products/abc", status: 200
  end

  def show
    @product = Spree::Product.find(params[:id])
    render "spree/api/products/show", status: 200
  end

  def search_by_name
    @products = Spree::Product.ransack(name_cont: params[:name]).result
    render "spree/api/products/index", status: 200
  end

  def products_on_date
    @products = Spree::Product.dishes_on_date(Date.parse(params[:date]))
    render "spree/api/products/index", status: 200
  end

  def products_in_days
  	date_from = Date.parse(params[:date_from])
  	date_to = Date.parse(params[:date_to])
    @abc = Spree::Product.products_in_days(date_from, date_to)
    render "spree/api/products/abc", status: 200
  end

end
