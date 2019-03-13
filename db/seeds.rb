require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Alphanumeric.alpha
  )
end
users = User.all

30.times do
	Registerapplication.create!(
		name: Faker::Company.name,
		url: Faker::Internet.url,
		user: users.sample
		)
end
registerapplications = Registerapplication.all


1.times do
  User.create!(
  email:     'zander.pritchard@gmail.com',
  password:  'helloworld',
  )
end

5.times do
	Event.create!(
		name: Faker::Commerce.product_name,
		registerapplication: registerapplications.sample
		)
end

puts "Seed finished"
puts "#{Registerapplication.count} registered apps created"
puts "#{User.count} users created"
puts "#{Event.count} events created"
