namespace :pop do
  desc "Populate users"
  task users: :environment do
    20.times do
      UserInfo.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email
      )
    end
  end

end
