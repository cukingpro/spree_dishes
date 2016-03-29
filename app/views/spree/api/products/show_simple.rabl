#on the menu

object @product

attributes :id, :name
node(:available_on){ |p| p.available_ons { |d| d.delivery_date } }
node(:dish_price) { |p| p.price }
node(:dish_currency) { |p| p.currency }
node(:likes) { |p| p.likes.count }
node(:current_user_like){ |p| p.current_user_like?(@current_user_id) }
child(:dish_type => :dish_type){ extends "spree/api/dish_types/show" }
child(:variant_images => :images) { extends "spree/api/images/show" }

