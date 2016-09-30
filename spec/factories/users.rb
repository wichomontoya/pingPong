FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    nick_name Faker::Name.first_name
    score Faker::Number.number(2)
    email Faker::Internet.email
    password Faker::Internet.password(10,20)
  end

end
