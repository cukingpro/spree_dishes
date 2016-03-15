object @product

attributes :id, :name, :dish_type_id, :description,  :dish_cooking_instructions
node(:available_on){|p| p.available_ons {|d| d.delivery_date}}
node(:dish_price) {|p| p.cost_price}
node(:dish_currency) {|p| p.cost_currency}
node(:likes) { |p| p.likes.count }
node(:current_user_like){|p| p.current_user_like?(@user_id)}
node(:dish_type){ |p| p.dish_type.name if p.dish_type }
child(:variant_images => :images) { extends "spree/api/images/show" }
child(:ingredients => :ingredients) { extends "spree/api/ingredients/show" }
child(:nutritions => :nutritions) { extends "spree/api/nutritions/show" }
child(:comments => :comments) { extends "spree/api/comments/show" }
