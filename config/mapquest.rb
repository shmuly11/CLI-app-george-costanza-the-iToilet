require 'mapquest'
require 'pry'

# binding.pry
# Instantiate the API using an API key
$mapquest = MapQuest.new(ENV["MAPQUEST"])

def location_request(address_input)
    data = $mapquest.geocoding.address(address_input)
end

def convert_to_geo(location)
    location.response[:results][0][:locations][0][:latLng]
end


