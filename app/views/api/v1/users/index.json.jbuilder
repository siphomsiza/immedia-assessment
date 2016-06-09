json.array!(@users) do |user|
  json.extract! user,  :id, :email, :system_admin, :active, :firstname, :lastname, :birthdate, :gender,:country_id, :country,:subdivision_id, :subdivision, :area_id, :area, :suburb, :suburb_id, :picture,:receive_newsletter, :created_at, :updated_at
end
