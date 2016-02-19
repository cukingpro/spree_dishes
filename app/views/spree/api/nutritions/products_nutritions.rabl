object false
node(:count) {@products_nutritions.count}
child(@products_nutritions => :products_nutritions) do
	node(:name) {|p| p.nutrition.name}
	attributes :unit, :quantity
end

