require 'twitter'
require 'dotenv'
require 'csv'
require 'pry'
load '../../db/townhalls.csv'

Dotenv.load('../../.env')

=begin 
follow les mairies du 35, 22, 56
t = CSV.table('townhalls.csv')
townhalls_name = t[:communes]
#for i in (1..hash.length-1)
#
#	ws[i, 1] = hash[i][:name]
#	ws[i, 2] = hash[i][:email]

def following
	while "@"+"mairie"+communes = nil
		"@"+"ville"+communes
	else
	end
end




#townhalls_name.each do |communes|
=end
class Follower

def initialize
	following_mass
end

def follow_mairies(handle)

client = Twitter::REST::Client.new do |config|
 	config.consumer_key        = ENV["TWITTER_API_KEY"]
  	config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  	config.access_token        = ENV["TWITTER_TOKEN_KEY"]
  	config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
end

	begin
    	client.follow(handle) #supprime le @
  	rescue Twitter::Error::TooManyRequests => error
    	sleep error.rate_limit.reset_in
    	retry
    	raise
    end
end

def following_mass
	CSV.foreach(File.dirname(__FILE__) + '/../../db/test.csv', :headers=>true) do |csv|
     puts "#{csv[3]}"
     follow_mairies(csv[3])
   end
end

binding.pry
end