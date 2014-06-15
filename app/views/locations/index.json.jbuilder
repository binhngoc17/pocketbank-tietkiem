json.array!(@locations) do |location|
  json.extract! location, :id, :provider_id, :address, :service_time, :lng, :lat, :street_number, :local_political, :sublocality_political, :route, :country_political, :administrative_area_level_1_political, :administrative_area_level_2_political, :name, :type
  json.url location_url(location, format: :json)
end
