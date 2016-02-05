object false
node(:count) { @dish_types.count }
child(@dish_types => :dish_types) do
  extends "spree/api/dish_types/show"
end

