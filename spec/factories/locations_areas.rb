FactoryGirl.define do
  factory :locations_area, :class => 'Locations::Area' do
    country_id ""
subdivision_id ""
name ""
code ""
data ""
active false
suburbs_count 1
  end

end
