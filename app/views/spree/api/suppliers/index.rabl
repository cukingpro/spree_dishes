object false
node(:count) { @suppliers.count }
child(@suppliers => :suppliers) do
  extends "spree/api/suppliers/show"
end