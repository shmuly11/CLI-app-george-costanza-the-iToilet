require_relative './config/environment'
require_relative './config/trivia_scraper'
require_relative './config/zip_code'
require_relative './config/intro'
require_relative './config/mapquest'



require 'sinatra/activerecord/rake'
require 'colorize'

desc "Start our app console"
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc "start our app"
task :start do
  app = HeresJohnny.new
  app.run
end



