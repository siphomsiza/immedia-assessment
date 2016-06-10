FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email()}
    before(:create) do |user|
      pass = Faker::Lorem.words(8)
      user.password = pass
      user.password_confirmation = pass
    end

    # after_initialize user profile
    initialize_with { new(firstname: Faker::Name.first_name,
                          lastname:  Faker::Name.last_name,
                          birthdate: Faker::Date.backward(14),
                          picture:   Faker::Avatar.image("profile-picture", "200x200"),
                          gender:    ["Male", "Female"][rand(2)].to_s
                          ) }

  end
end
