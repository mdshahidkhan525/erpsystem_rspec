FactoryBot.define do
  factory :student, class: Student do
    id { rand(1..25) } 
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    father_name { Faker::Name.name }
    email_id { Faker::Internet.email }
    password { '123456' }
    roll_no  { rand(81524564..89545665) }
    mobile { rand(6858567864..9585458698) }
    student_class { '7th' }
  end
end
