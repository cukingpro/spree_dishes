object @product
cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]
attributes :id, :name, :dish_type_id, :available_on
node(:dish_price) {|p| p.cost_price}
node(:dish_currency) {|p| p.cost_currency}
node(:likes) { 0 }
child(:variant_images => :images) { extends "spree/api/images/show" }