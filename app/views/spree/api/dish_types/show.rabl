object @dish_type
attributes :id, :name, :description, :is_active
child(:images => :images) { extends "spree/api/dish_types/image" }