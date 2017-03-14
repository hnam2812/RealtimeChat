puts "Create sample users"
5.times do |t|
  User.create email: "User#{t}@example.com", password: "user123",
    last_name: Faker.name, first_name: Faker.name
end
