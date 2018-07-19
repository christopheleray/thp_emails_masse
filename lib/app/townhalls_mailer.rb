# class Mailers permettant d'envoyer recuperer les emails dun fichier csv
# et de leur envoyer un email
require 'gmail'
require 'dotenv'
require 'pry'
require 'csv'
Dotenv.load('../../.env') 

class Mailers
# methode d'intialisation on lance la methode send_mass_mailing via Mailers.new
  def initialize
  send_mass_mailing
  end 
# Methode qui va récupérer donnée d'un csv et envoyer email
  def send_mass_mailing
    CSV.foreach(File.dirname(__FILE__) + '/../../db/townhalls.csv', :headers=>true) do |csv|
      send_email(csv[2],csv[0]) # call la fonction send_email et lui passe en parametre la colonne 3 et la colonne 1 du csv
      puts "email sent to #{csv[0]} at #{csv[2]}" #affiche à l'écran l'email envoyé
    end
  end
# Méthode pour envoyer email avec argument email et nom
  def send_email(email, name)
      gmail = Gmail.connect!("thprennes@gmail.com", ENV["PASSWORD"]) #connexion au compte email
      email = gmail.deliver do # envoie d'email
      to "#{email}"
      subject "The Hacking Project"
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "<p>
                Bonjour,
            </p>
            <p>
                Je m'appelle Christophe, je suis élève à The Hacking Project,
                une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique.
            </p> 
            <p>
                La pédagogie de notre école est celle du peer-learning, 
                où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code.
                Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
            </p>
            
            <p>
                Déjà 300 personnes sont passées par The Hacking Project. Est-ce que la mairie de <b>#{name.capitalize}</b> veut changer le monde avec nous ?
            </p>
            
            <p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
        end
    end
    gmail.logout # Deconnexion de Gmail
  end
end #fin de classe Mailers
