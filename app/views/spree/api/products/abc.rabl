collection @abc 

#node(:date) { |a| a[:date] }
#node(:products) { |a| a[:products] extends "spree/api/products/show_simple2"}

node(){ |a|
	node(:date){a[:date]}
	child(a[:products] => :products){ extends "spree/api/products/show_simple2" }
}