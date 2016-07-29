# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Recipe.create(name:'BBQ Chicken Salad', category: 'salad')
r2 = Recipe.create(name:'Turkey Artichoke Salad', category: 'salad')
i1 = Item.create(name:'Tomato Roma', yield:0.95, price:0.90, calorie:22)
i2 = Item.create(name:'Kale Purple', yield:0.55, price:1.90, calorie:33)
