Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api do

    resources :dish_types do
    	resources :products
    end
    
    resources :products do
    	resources :ingredients
      resources :nutritions
    end

    resources :ingredients
    resources :nutritions
    
    
  end

end
