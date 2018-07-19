require 'twitter'
require 'dotenv'
require 'csv'
require 'pry'
require 'watir'
#load '../../db/townhalls.csv'

Dotenv.load('../../.env')


class Follower


def scrapp_twitter

  list_handle = [" "]

  username = "thprennes@gmail.com"
  password = ENV["PASSWORD"]

CSV.foreach(File.dirname(__FILE__) + '/../../db/townhalls.csv', :headers=>true) do |csv|
  browser = Watir::Browser.new :firefox
  browser.goto "http://twitter.com/login" #se connecte directement sur http://twitter.com/login
  browser.text_field(:class => 'js-username-field email-input js-initial-focus').set "thprennes@gmail.com" #identifiant twitter
  browser.text_field(:class => 'js-password-field').set "thprennes2018" #password twitter
  browser.button(:class => 'submit EdgeButton EdgeButton--primary EdgeButtom--medium').click #clique sur connecter
  browser.text_field(:id => 'search-query').click #click dans rechercher
  var = browser.text_field(:id => 'search-query').set "mairie " + csv[0]
  sleep(1)
  var = browser.text_field(:id => 'search-query').set "mairie " + csv[0] + " "
  s = browser.span class: 'username u-dir'
  s.exists?
  list_handle << s.text[1..-1]
  browser.close
  sleep(5)
  end
  return list_handle
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
	CSV.foreach(File.dirname(__FILE__) + '/../../db/townhalls.csv', :headers=>true) do |csv|
     puts "#{csv[3]}"
     follow_mairies(csv[3])
   end
end

end