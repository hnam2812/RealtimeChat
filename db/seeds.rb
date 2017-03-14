puts "Create sample users"
5.times do |t|
  User.create email: "User#{t}@example.com", password: "user123",
    last_name: Faker::Name.last_name , first_name: Faker::Name.first_name
end
