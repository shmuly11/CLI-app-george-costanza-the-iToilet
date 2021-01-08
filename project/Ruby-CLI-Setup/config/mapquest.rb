require 'mapquest'
require 'pry'

# Instantiate the API using an API key
$mapquest = MapQuest.new("pD0NRdSBTXF028j7ZIAaU6HcV1DGAW8O")

def location_request(address_input)
    data = $mapquest.geocoding.address(address_input)
end

def convert_to_geo(location)
    location.response[:results][0][:locations][0][:latLng]
end


