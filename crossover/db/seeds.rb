require 'faker'
3.times do
  [ firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password].each do |customer_attributes|
    Customer.create(customer_attributes)
  end




end
