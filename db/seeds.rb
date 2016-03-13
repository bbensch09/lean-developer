# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Profile.delete_all
Snippet.delete_all

#CREATE LIST OF OPTIONS TO RANDOMLY SELECT FROM
age_array = (18...65).to_a
political_affiliation_array = ['Democrat','Democrat','Republican','Republican','Independent']

20.times do
  User.create!({
      email: Faker::Internet.safe_email,
      password: 'password'
    })
  Profile.create!({
      user_id: User.last.id,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      age: age_array.sample,
      about_me: Faker::Hacker.say_something_smart,
      display_name: Faker::Internet.user_name,
      political_affiliation: political_affiliation_array.sample
    })
end
