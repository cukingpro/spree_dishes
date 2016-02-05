object @ingredient
attributes :id, :name, :description

child(:images => :images) do
	extends "spree/api/ingredients/images"
end