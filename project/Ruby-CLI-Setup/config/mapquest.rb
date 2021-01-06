require 'mapquest'
require 'pry'

# Instantiate the API using an API key
$mapquest = MapQuest.new("pD0NRdSBTXF028j7ZIAaU6HcV1DGAW8O")

def location_request(address_input)
# Get geolocation data
data = $mapquest.geocoding.address(address_input)
#binding.pry
end

def convert_to_geo(location)
    location.response[:results][0][:locations][0][:latLng]
    # Get lat/long coordinates of all the locations found
    #data.locations.each { |location| puts location[:latLng] }
end

# 
