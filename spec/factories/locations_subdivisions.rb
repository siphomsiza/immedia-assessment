FactoryGirl.define do
  factory :locations_subdivision, :class => 'Locations::Subdivision' do
    country_id ""
name ""
code ""
data ""
active false
parent_subdivision_id ""
children_subdivisions_count 1
areas_count 1
  end

end
