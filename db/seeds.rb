# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name:'Others')
Category.create(name:'Books')
Category.create(name:'Foods')
Category.create(name:'Medicines')

Tax.create(name:'Basic', rate:10.0)
Tax.create(name:'Import Duty', rate:5.0)

Item.create(name:'Chocolate', price:45.20, in_stock:54, is_imported:false, category_id:1)
Item.create(name:'The Great Book', price:48.0, in_stock:87, is_imported:true, category_id:2)
