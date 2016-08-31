# Vattentornet

[![Dependency Status](https://gemnasium.com/klaseskilson/vattentornet.svg)](https://gemnasium.com/klaseskilson/vattentornet)
[![Build Status](https://travis-ci.org/klaseskilson/vattentornet.svg)](https://travis-ci.org/klaseskilson/vattentornet)

En fin hemsida för studentpuben **[Pub Vattentornet](http://www.vattentor.net)** i Norrköping.

Vi som pillar på denna sidan är:
* [Carl Englund](https://twitter.com/Englundi)
* [Erik Sandrén](https://twitter.com/tistatos_)
* [Klas Eskilson](https://twitter.com/Eskilicious)
* [Daniel Rönnkvist](https://twitter.com/trevligheten)

tack pello<3

## Bidra!

Du får hemskt gärna bidra till denna fantastiska sida! Har du en asball feature,
ett grymt påskägg eller bara tycker det är skoj med bärs och kod så ska du inte
låta något hindra dig. Vi föreslår att du gör något utav följande:

1. Forka repot, gör din coola grej i en ny branch och skapa en pullrequest till `develop`-branchen här. Se till att förklara det du gör med **tydliga och välförklarande** commits. Hellre många små än få stora.
2. Kommer förbi [Puben](http://www.vattentor.net/kontakt) och snackar med dem där.
3. Skapa ett issue direkt till detta repo med ditt förslag.
4. Dricker en [Hercules](http://www.vattentor.net/sortiment/dipa/herkules) och hoppas att det löser sig.

## Kom igång

Detta är en Ruby on Rails-app. För att utveckla sidan kan vi varmt rekommendera
[tryruby.org](http://tryruby.org/) samt [railsforzombies.org](http://railsforzombies.org/).

Börja med att installera [Docker](https://www.docker.com/). När det är gjort och
allt funkar, kör dessa commandon i din favvoterminal:

```shell
# create docker machine and install dependencies
docker-compose build
# start machine
docker-compose up
# create database
docker-compose run web rake db:create
```

Du kommer nu åt sidan via  [`localhost:3000`](http://localhost:3000). Om du behöver
göra något mot servern, till exempel komma åt Rails-consolen, kör dina kommandon
genom att skriva `docker-compose run web ` innan kommandona. Tex
`docker-compose run web rails c`.

### Alternativ lösning: lokal installation

Om du inte vill använda docker kan du installera allt som behövs lokalt.Börja med att
installera [Ruby](https://www.ruby-lang.org/en/) och kila in på
[rubyonrails.org](http://rubyonrails.org/) och följa instruktionerna där.

Du beövher också installera och få igång [*PostgreSQL*](#postgresql-setup). När det är gjort är det bara att sätta igång:

```
bundle install
rake db:migrate
rails server
```

#### PostgreSQL setup

Denna applikationen använder sig utav PostgreSQL. Installera och sedan behöver du skapa en en användare och två databaser, följ bara dessa instruktioner:

1. Skapa en databasanvändare som matchar den i [`database.yml`](config/database.yml). Vi använder `postgresql` som användarnamn, så i psql-terminalen skriver du `CREATE USER postgresql;`.
1. Skapa *development*-databasen `CREATE DATABASE vattentornet_development;`
och *test*-databasen med `CREATE DATABASE vattentornet_test;`.
1. Ändra ägaren genom att köra `ALTER DATABASE vattentornet_development OWNER TO postgresql;`
and `ALTER DATABASE vattentornet_test OWNER TO postgresql;`.
1. Klart!

### Lägg till en ny användare

Öppna upp en Rails-konsol genom att köra `rails c` eller `rails console` i din
favorit-terminal. (Se till så att du har migrerat databasen genom att först skriva
`rake db:migrate`.) När Rails-konsolen kommit igång borde det stå något i stil med
`Loading development environment (Rails 4.1.1)`, och då vill du skriva:

```
User.create(email: 'din@email.se', admin: true)
```

Gå sedan in på [`localhost:3000/letter_opener`](http://localhost:3000/letter_opener)
och öppna mailet som skall ha dykt upp där om allt gick vägen.

### BreweryDB – Info om drycker

Vi använder BreweryDB! För att använda detta behöver ni ha tillgång till en API-nyckel
från dem. Gör det genom att gå in [här](http://www.brewerydb.com/developers/apps).
Först, spara api-nyckeln som en miljövariabel i din datta!

Detta gör du lämpligtvis genom att först **kopiera** [`config/application.example.yml`](config/application.example.yml) till
`config/application.yml`. Lägg sedan in nyckeln du fått från BreweryDB på rätt plats i din nya fil.

Det som är viktigt här är att den heter just `BREWERYDB_API_KEY`, eftersom det är här
rails-appen kommer leta efter nyckeln i [`config/initializers/brewery_db.rb`](config/initializers/brewery_db.rb).

Läs mer om gemet [`brewery_db` här](https://github.com/tylerhunt/brewery_db)!

_______

:beers: Livet är för kort för att dricka dålig öl! :beers:
