FactoryGirl.define do
  factory :locations_suburb, :class => 'Locations::Suburb' do
    country_id ""
subdivision_id ""
area_id ""
name ""
code ""
data ""
active false
  end

end
