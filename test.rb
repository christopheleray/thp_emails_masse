require 'twitter'
require 'dotenv'
require 'csv'
require 'pry'
#load '../../db/townhalls.csv'

Dotenv.load('../../.env')

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
    config.consumer_secret     = ENV["TWITTER_API_SECRET"]
    config.access_token        = ENV["TWITTER_TOKEN_KEY"]
    config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]

 client.user_search('marie rennes')

 binding.pry