# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
raise "Development seeds only (for now)!" unless Rails.env.development?

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 0,
  price: 987.65
})

reference_product = cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

# USERS
User.destroy_all
puts 'Putting in a few users...'

reference_user = User.create(first_name: 'Gaber', last_name: 'Archie', email: 'gaber@gaber.gaber', password_digest: '$2a$10$ug6en5vF0sb/x9si1S/pdODofOaFuBP0dwdNW1ajLwnAsVLx4DLwO')

# REVIEWS
Review.destroy_all
puts 'Putting in some reviews!...'

# Review.create(product_id: 12, user_id: 1, description: 'This sucks!', rating: 1)
# Review.create(product_id: 11, user_id: 1, description: 'SoldOUT?!', rating: 4, created_at: '2016-11-15 02:15:21.997964', updated_at: '2016-11-15 02:15:21.997964')
# Review.create(product_id: 8, user_id: 1, description: 'This is great!!!!', rating: 5, created_at: '2016-11-15 02:15:21.997964', updated_at: '2016-11-15 02:15:21.997964')
# Review.create(product_id: 202, user_id: 13, description: 'What the hell?', rating: 1, created_at: '2016-11-15 02:15:21.997964', updated_at: '2016-11-15 02:15:21.997964')
Review.create(product_id: reference_product.id, user_id: reference_user.id, description: 'What the hell?', rating: 1, created_at: '2016-11-15 02:15:21.997964', updated_at: '2016-11-15 02:15:21.997964')


puts "DONE!"
