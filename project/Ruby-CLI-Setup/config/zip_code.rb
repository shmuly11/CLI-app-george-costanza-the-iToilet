
require 'pry'
require 'json'

file = File.read('us-zip-code-latitude-and-longitude.json')
data_hash = JSON.parse(file)

$converts = {}

data_hash.each do |data|
    $converts[data["fields"]["zip"]] = data["fields"]["geopoint"]
end
