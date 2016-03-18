Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api do

    resources :dish_types do
    	resources :products
    end
    
    resources :products do
    	# resources :ingredients, controller: 'product_ingredients' 
     #  resources :nutritions, controller: 'product_nutritions'
      resources :ingredients
      resources :nutritions
    end
    post "/products/search_by_name" => "/spree/api/products#search_by_name" 
    post "/products/products_on_date" => "/spree/api/products#products_on_date"

    resources :ingredients
    resources :nutritions
    
    
  end

end
