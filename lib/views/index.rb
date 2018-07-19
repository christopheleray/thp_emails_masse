load 'done.rb'
$: << File.join(File.dirname(__FILE__), "/../app")
load 'townhalls_adder_to_db.rb'
load 'townhalls_follower.rb'
load 'townhalls_mailer.rb'
load 'townhalls_scrapper.rb'

class Index
	def initialize #lance Index.menu et initialise le fichier csv avec un header
    puts "Bienvenue"
    puts ""
    Index.menu
		DBAdder.new
	end

	def Index.menu # Affiche à l'utilisateur le menu
			puts "Tapes 1 pour récupérer dans le fichier 'townhalls.csv' :"
			puts "- les noms des mairies"
			puts "- les départements des mairies"
			puts "- les emails des mairies"
			puts ""
			puts "Tapes 2 pour envoyer des emails aux mairies"
			puts ""
			puts "Tapes 3 pour récupérer les handles twitter des mairies dans le csv;"
			puts "et suivre les comptes twitter des mairies"
			puts ""
			puts "Tapes 4 pour sortir"
			puts ""
			print "->"
			Index.choices
	end

	def Index.choices # Récupère le choix de l'utilisateur
		i = gets.to_i

		if i == 1
			Index.do_scrapping
		elsif i == 2
			Index.do_mailing
		elsif i == 3
			Index.do_following
		elsif i == 4

		else
			puts "Choix impossible" # Renvoie au menu lors d'un mauvais choix
			puts ""
			Index.menu
		end
	end

	def Index.do_scrapping # Lance le scrapping et la vérification associée
		DBAdder.townhalls_adder_to_emails_to_csv
		Done.verification_scrapper
	end

	def Index.do_mailing # Lance le mailing et la vérification associée
		Mailers.new
		Done.verification_mailer
	end

	def Index.do_following # Lance le following et la vérification associées
		DBAdder.add_twitter_handles_to_csv
		Follower.following_mass
		Done.verification_follower
	end
end
