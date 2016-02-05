object false
node(:count) { @nutritions.count }
child(@nutritions => :nutritions) do
  extends "spree/api/nutritions/show"
end