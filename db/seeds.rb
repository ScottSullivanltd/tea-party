require "factory_bot_rails"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Customer.destroy_all
Tea.destroy_all

customers = FactoryBot.create_list(:customer, 50)
teas = FactoryBot.create_list(:tea, 15)

customers.each do |customer|
  teas.each do |tea|
    FactoryBot.create(:subscription, customer_id: customer.id, tea_id: tea.id)
  end
end
