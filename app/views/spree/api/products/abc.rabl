collection @abc 

node(){ |a|
	node(:date){a[:date]}
	child(a[:products] => :products){ extends "spree/api/products/show_simple2" }
}