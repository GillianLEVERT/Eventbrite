require 'faker'

#DESTROY
User.destroy_all
Event.destroy_all
Attendance.destroy_all

#USER
10.times do
  User.create(email: "#{Faker::Games::Pokemon.name}@yopmail.com", encrypted_password: 'proutlol',
              description: Faker::Movies::BackToTheFuture.quote, first_name: Faker::Games::Heroes.name, last_name: Faker::FunnyName.name)
end
