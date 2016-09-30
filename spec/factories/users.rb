FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    nick_name Faker::Name
    score Faker::Number
    email Faker::Internet.email
    password Faker::Internet.password(10,20)
  end

end
