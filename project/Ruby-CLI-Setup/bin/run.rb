require_relative '../config/environment'
require_relative '../config/trivia_scraper'
require_relative '../config/zip_code'
require_relative '../config/mapquest'

app = HeresJohnny.new
app.run
