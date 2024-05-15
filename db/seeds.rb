# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


10.times do
  User.create(name: Faker::Name.name)
  Company.create(name: Faker::Company.name)
end

Category.create(name: "A")
Category.create(name: "B")
Category.create(name: "C")

Product.create(name: "MIMCO AM - Santos Townhouse")
Product.create(name: "BlackRock - Europe Property Fund VI")
Product.create(name: "Mimco AM - The Butler")
Product.create(name: "Pierre Premier Gestion - BK OPCI")
Product.create(name: "Livret P")
Product.create(name: "SL Reim - Paris Stratégie Opportuniste")
Product.create(name: "SL Reim - La Plagne")
Product.create(name: "Passoires Thermiques")

User.all.each do |user|
  UserProduct.create(user: user, product: Product.all.sample, category: Category.all.sample, balance: rand(1000.0..40000.0).round(2), status: "A", transaction_type: "A")
end

Company.all.each do |company|
  CompanyProduct.create(company: company, product: Product.all.sample, category: Category.all.sample, balance: rand(1000.0..40000.0).round(2), status: "A", transaction_type: "A")
end
