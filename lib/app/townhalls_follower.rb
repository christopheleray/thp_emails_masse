require 'twitter'
require 'dotenv'
require 'csv'
require 'pry'
#load '../../db/townhalls.csv'

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
# Définition de la classe Follower
class Follower

# Initialization de la classe Follower en lancant Follower.new
def initialize
	following_mass 
end

# Methode permettant de suivre une liste psuero twitter
def follow_mairies(handle)
# connexion a twitter
client = Twitter::REST::Client.new do |config|
 	config.consumer_key        = ENV["TWITTER_API_KEY"]
  	config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  	config.access_token        = ENV["TWITTER_TOKEN_KEY"]
  	config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
end
# permet de suivre chaue pseudo passé en arguement
	begin
    	client.follow(handle) #supprime le @
  	rescue Twitter::Error::TooManyRequests => error
    	sleep error.rate_limit.reset_in
    	retry
    	raise
    end
end

# Methode permettant de recupérer tout les ppsueod twitter d'un csv puis de les suivre
def following_mass
	CSV.foreach(File.dirname(__FILE__) + '/../../db/twonhalls.csv', :headers=>true) do |csv|
     puts "#{csv[3]}"
     follow_mairies(csv[3])
   end
end

binding.pry
end