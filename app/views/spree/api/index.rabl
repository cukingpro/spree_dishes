object false
node(:count) { @supplier.count }
child(@supplier => :supplier) do
  extends "spree/api/supplier/show"
end