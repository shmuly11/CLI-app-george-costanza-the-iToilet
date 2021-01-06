class TriviaScraper < Kimurai::Base
    @@base_url = "https://thefactfile.org/toilets-facts/"
        @name= 'toilet_trivia'
        @start_urls = [@@base_url]
        @engine = :selenium_chrome

        def parse(response, url:, data: {})
            doc = browser.current_response
            $scraped_trivia << doc.css(".td-post-content p")
            
            # $facts = []
            # $scraped_trivia.flatten.each do |fact|
            #     #binding.pry
            #     $facts << fact.text
            # end
            #binding.pry
        end
end
