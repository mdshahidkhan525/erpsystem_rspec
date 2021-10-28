FactoryBot.define do
  factory :faculty, class: Faculty do
    first_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { '123456' }
  end
end
