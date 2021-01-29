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

Item.create(
  name:'Chocolate',
  price:10,
  taxed_price:10,
  in_stock:54,
  is_imported:false,
  category_id:1
)
Item.create(
  name:'The Great Book',
  price:48.0,
  taxed_price:50.4,
  in_stock:87,
  is_imported:true,
  category_id:2
)
Item.create(
  name:'Painkiller',
  price:18.0,
  taxed_price:21.5,
  in_stock:12,
  is_imported:false,
  category_id:4
)
Item.create(
  name:'Chainsaw',
  price:842.32,
  taxed_price:1083.21,
  in_stock:11,
  is_imported:true,
  category_id:1
)
