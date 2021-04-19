require 'bundler'
require 'json'
require 'rest-client'
require "audio-playback"
require 'colorize'
require 'dotenv/load'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

require_all 'app'
