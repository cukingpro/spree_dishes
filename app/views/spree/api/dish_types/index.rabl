object false
node(:count) { @dish_types.count }
child(@dish_types => :dish_types) do
  attributes :id, :name
end

