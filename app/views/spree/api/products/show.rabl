@product
extends "spree/api/products/small_show"

attributes :description,  :dish_cooking_instructions

node(:time_cook){}
node(:difficulty){}