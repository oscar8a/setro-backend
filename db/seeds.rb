# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'setrodb.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Product.new
  t.identity = row['identity']
  t.species = row['species']
  t.common_name = row['common_name']
  t.origin = row['origin']
  t.country = row['country']
  t.viable_seed_per_kg = row['viable_seed_per_kg']
  t.availability = row['availability']
  t.uses = row['uses']
  t.price = row['price']
  t.save
  puts "#{t.common_name} has been seeded to DB"
end
puts "There are now #{Product.count} rows in the product table"

User.create(first_name: 'oscar', last_name: 'ochoa', email: 'email', password: 'password', phone: '1800', street: '613 Wilson', city: 'Brooklyn', state: 'NY', zipcode: 11207)
User.create(first_name: 'Jose', last_name: 'Jose', email: 'email2', password: 'password', phone: '18007070', street: '613 Mexico', city: 'Monterrey', state: 'MY', zipcode: 11200)

