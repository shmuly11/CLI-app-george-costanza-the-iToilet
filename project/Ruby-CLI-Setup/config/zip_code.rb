# class ZipCode < Kimurai::Base
#     @@base_url = "https://public.opendatasoft.com/explore/dataset/us-zip-code-latitude-and-longitude/table/?q=New+York"
#         @name= 'zip_code'
#         @start_urls = [@@base_url]
#         @engine = :selenium_chrome


#         $scraped_zip_codes= []

#         def parse(response, url:, data: {})
#             doc = browser.current_response
#             $scraped_zip_codes << doc.css(".odswidget-table__records-tbody tr")
        
#             binding.pry
            
#             # $facts = []
#             # $scraped_trivia.flatten.each do |fact|
#             #     #binding.pry
#             #     $facts << fact.text
#             # end
#             #binding.pry
#         end
# end
require 'pry'
require 'json'
file = File.read('us-zip-code-latitude-and-longitude.json')
data_hash = JSON.parse(file)
$converts = {}
data_hash.each do |data|
    $converts[data["fields"]["zip"]] = data["fields"]["geopoint"]
end
#binding.pry