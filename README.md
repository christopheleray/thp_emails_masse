<h1>Envoi d'emails en masse</h1>
  <h2>Présentation du projet</h2>
    <h3>l'équipe</h3>
      <p>Nous sommes l'équipe Rennaise de la session 5 de The Hacking Project (été 2018). Parmis nous se trouvent Sandrine Le Breton, Romain Saillour, Rémi Samson, Christophe Leray et Léona Chevrel.</p>
    <h3>Le projet</h3> 
      <p>Le programme préseenté dans ce dossier permet de récuperer les addresses emails, les noms, le departement et le handle twitter de toutes les mairies des Côtes d'Armor, du Finistère et du Morbihan. Une fois ces données récuperées, il est possible d'envoyer des emails à toutes ces mairies simultanement et de les suivre automatiquement sur Twitter.</p>
    <h3>Utilisation rapide</h3>
    <p>Commencez par fork le repository Github du projet et clonez le dans lee repo de votre</p>
    <p>Installez les gems ruby qui vont être utilisées dans ce programme en lançant cette commande dans le terminal</p>
    <pre>
      <code>$ bundle install</code>
    </pre>
    <p>Ajoutez un fichier .env à la racine du dossier dans lequel vous noterez vos clés d'API pout Twitter et Gmail</p>
    <pre>
      <code>$ touch .env</code>
    </pre>
    <pre>
      <code>  {
             GOOGLE_CLIENT_ID="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.apps.googleusercontent.com"
             GOOGLE_CLIENT_SECRET="XXXXXXXXXXXXXXXXXXXXX"
             PASSWORD="XXXXXXXXXXXXXXXX"
             TWITTER_API_KEY='XXXXXXXXXXXXXXXXXXXXXXXXX'
             TWITTER_API_SECRET='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
             TWITTER_TOKEN = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
             TWITTER_TOKEN_SECRET = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
            }</code>
    </pre>
    <p>Lancez le programme gràce à la commande suivante :</p>
    <pre>
      <code>$ ruby app.rb</code>
    </pre>
    <p>Laissez vous ensuite guider par le programme</p>
  <h2>Arborescence</h2>
    <p>Une fois le repository cloné sur votre machine, vous devriez avoir l'arboressence suivante pour vos fichiers :</p>
    <pre>
      <code>  thp_emails_masse
              ├── .gitignore
              ├── README.md
              ├── Gemfile
              ├── Gemfile.lock
              ├── app.rb
              ├── db
              │   └── townhalls.csv
              └── lib
                  ├── app
                  │   ├── townhalls_scrapper.rb
                  │   ├── townhalls_mailer.rb
                  │   ├── townhalls_adder_to_db.rb
                  │   └── townhalls_follower.rb
                  └── views
                      ├── done.rb
                      └── index.rb</code>
    </pre>
    <h4>.gitignore</h4>
      <p>permet de cacher les clés d'API sur Github</p>
     <h4>Gemfile</h4>
      <p>crée le bundle permettant d'intaller les gems ruby qui vont être utilisées par le programme</p>
     <h4>app.rb</h4>
      <p>le fichier ruby contenant le necessaire pour lancer le programme</p>
     <h4>db</h4>
      <p>dossier contenant les bases de données créées et utilisées par le programme<p>
      <h6>townhalls.csv</h6>
        <p>base de données au format CSV</p>
     <h4>lib</h4>
      <p>contiens les fichiers executés par app.rb</p>
      <h5>app</h5>
        <p>Contiens les fichiers de classes utilisés lors de l'execution du programme</p>
        <h6>townhalls_scrapper.rb</h6>
          <p>Fichier contenant les fonctions nécessaires pour scrappe les adresses email des mairies des 3 départements sélectionnés</p>
        <h6>townhalls_mailer.rb</h6>
          <p>Fichier contenant les fonctions nécessaires pour envoyer des emails aux adresses contenues dans la base de données</p>
        <h6>townhalls_adder_to_db.rb</h6>
          <p>Fichier contenant les fonctions nécessaires pour rentrer les données prises sur l'annuaire des mairies et Twitter dans la base de données</p>
        <h6>townhalls_follower.rb</h6>
          <p>Fichier contenant les fonctions nécessaires pour scrappe les handles des mairies sur Twitter et follow tous ces handles</p>
      <h5>views</h5>
        <p>Ce dossier contiens tout ce qui a trait à l'interaction avec l'utilisateur&#183;ice</p>
        <h6>done.rb</h6>
          <p>Fichier contenant les fonctions affichant quand une fonctionnalité du programme à finis de tourner</p>
        <h6>index.rb</h6>
          <p>Fichier contenant les fonctions permettant à l'utilisateur&#183;ice d'interragir avec le programme</p>
  <h2>Comment bien utiliser le programme?</h2>
    <h3>Gems</h3>
      <p>Ruby est un langage utilisant des parties téléchargeables appelées "gems" qui permettent d'executer certaines fonctions. Nous allons vous expliquers quelles sont les gems utilisées dans notre programme et quelle est leur utilité.</p>
      <pre>
        <code>
        source "https://rubygems.org"
        ruby '2.5.1'
        gem 'rubygems'
        gem 'nokogiri'
        gem 'open-uri'
        gem 'watir'
        gem 'twitter'
        gem 'gmail'
        </code>
      </pre>
      <h6>ruby '2.5.1'</h6>
        <p>Cette ligne précise à l'ordinateur que nous utilisons la version 2.5.1 de Ruby</p>
      <h6>nokogiri</h6>
        <p>Nokogiri est une gem permettant d'aller récuperer des données à partir d'un sitee statique. Cette gem fonctionne en paire avec open-uri. Pour plus d'information, rendez-vous sur <a href='https://github.com/sparklemotion/nokogiri'>le github de la gem</a></p>
      <h6>open-uri</h6>
        <p>Voir 'Nokogiri'</p>
      <h6>watir</h6>
        <p>Une autre gem permettant de récuperer des données depuis des sites internet mais avec cette fois-ci des fonctionnalités supplémentaires. Pour plus d'information, réferez-vous à <a href='http://intro-scrap-watir.surge.sh/'>ce tutoriel</a> et à la <a href='http://watir.com/guides/'>dcumentation watir</a></p>
      <h6>twitter</h6>
        <p>Une gem permettant d'utiliser twitter sans passer par l'interface graphique du site. Pour plus d'information, rendez-vous sur <a href'https://github.com/sferik/twitter'>la page github de la gem</a></p>
      <h6>gmail</h6>
        <p>La gem gmail permet d'utiliser une adresse mail @gmail.com sans passer par l'interface graphique du site. Pour plus d'information, rendez vous sur <a href='https://github.com/gmailgem/gmail'>la page github de la gem</a></p>
    <h3>Découpage par fichiers</h3>
      <p>Notre programme est découpé en plusieurs fichiers, chacun correspondant à une partie précise du code, apelée Objet. Ces objets sont interconnectés et permettent d'avoir accès rapidement à certaines parties du code. Nous avons rangé nos objets en 6 classes :</p>
      <h4>Récuperation de l'annuaire des mairies</h4>
        <p>La classe Scrapper se situe dans le fichier 'townhalls_scrapper.rb'. Elle comprend tout ce qui a trait à la récuperation des adresses emails des mairies selectionnées. Cette classe utilise les gem nokogiri et open-uri afin de passer sur chaque page concernée récuperer les données qui nous interessent et de les stocher dans un tableau de hash qui pourra être réutilisé pour mieux stocker les données.</p> 
      <h4>Utilisation de Twitter</h4>
        <p>La classe Follower se situe dans le fichir 'townhalls_followers.rb'. Elle comprend ce qui a trait à la recherche des handles twitter des mairies des villes sur notre liste et s'occupe de follow les mairies possedant un compte twitter. Cette classe utilise les gems watir et twitter</p>
      <h4>Envoi de mails</h4>
        <p>La classe Mailers se situe dans le fichier 'townhalls_mailer.rb'. Ellce comprnd tout ce qui a trait à l'envoi d'emails aux adresses comprises dans la base de données. Elle utilise la gem gmail</p>
      <h4>Implémentation de la base de données</h4>
        <p>La classe DBAdder se situe dans le fichier 'townhalls_adder_to_db.rb'. Elle comprend tout ce qui a trait à l'implémentation de la base de données. Elle est appelée après l'utiisation des classes Scrapper et Followers. Cette classe n'utilise pas de gems n'étant pas présentes dans le bundle de base de ruby 2.5.1</p>
      <h4>Interface utilisateur</h4>
        <p>La classe Index se situe dans le fichier 'index.rb' et permet à l'utilisateur d'interagir avec le programme en lui permettant de choisir l'action à effectuer à partir d'un menu. Une fois l'action choisie, une methode permet de l'effectuer.</p>
      <h4>Fin d'execution des méthodes</h4>
        <p>La classe Done se trouve dans le fichier 'done.rb' et d'afficher un message à la fin de l'execution d'une tache par Index.</p>
  <h2>Qu'avons nous fait avec ce programme ?</h2>
    <p>Avec ce programme nous avons récupré les noms, code insee, adresses email et handle Twitter (si cette mairie possede un compte Twitter) de toutes les mairies des Côtes d'Armor, du Finistère et du Morbihan. Grâce à ces donées nous avons pu envoyer un email à chacune des mairies pour leur parler de la formation The Hacking Project. Si les mairies possedent un compte Twitter, nous avons suivis ce compte avec le compte twitter de notre session THP Rennes (<a href='https://twitter.com/thp_bzh5'>THP_Rennes_session5</a>)</p>
