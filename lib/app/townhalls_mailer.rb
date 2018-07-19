require 'gmail'
require 'dotenv'
require 'pry'
require 'csv'
Dotenv.load('../../.env') 

class Mailers

  #attr_accessor :gmail  

  def initialize
  send_mass_mailing
  end 

  def send_mass_mailing
    tab = []
    CSV.foreach(File.dirname(__FILE__) + '/../../db/townhalls.csv', :headers=>true) do |csv|
      send_email(csv[2],csv[0])
      puts "email sent to #{csv[0]} at #{csv[2]}"
    end
    return true 
  end

  def send_email(email, name)
      gmail = Gmail.connect!("thprennes@gmail.com", ENV["PASSWORD"])
      email = gmail.deliver do
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
    #email.deliver!
    #gmail.logout
  end

binding.pry

end
