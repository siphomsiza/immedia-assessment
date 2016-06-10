FactoryGirl.define do
  factory :user_profile do
    association(:user)
    picture    {Faker::Avatar.image("profile-picture", "200x200")}
    firstname  {Faker::Name.first_name}
    lastname   {Faker::Name.last_name}
    birthdate  {Faker::Date.backward(14)}
    gender     {["Male", "Female"][rand(2)].to_s}
  end
end
