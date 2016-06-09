FactoryGirl.define do
  factory :locations_country, :class => 'Locations::Country' do
    name ""
code ""
data ""
active false
subdivisions_count 1
  end

end
