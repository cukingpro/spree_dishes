Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api do

    resources :dish_types do
    	resources :products
    end
    resources :ingredients
    resources :products do
    	resources :ingredients
    end

    
    
  end

end
