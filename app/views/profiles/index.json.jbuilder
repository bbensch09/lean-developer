json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :city, :state, :age, :about_me, :display_name, :political_affiliation
  json.url profile_url(profile, format: :json)
end
