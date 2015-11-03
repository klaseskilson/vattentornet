# Vattentornet

[![Dependency Status](https://gemnasium.com/klaseskilson/vattentornet.svg)](https://gemnasium.com/klaseskilson/vattentornet)

En fin hemsida för studentpuben **[Pub Vattentornet](http://www.vattentor.net)** i Norrköping.

Vi som pillar på denna sidan är:
* [Carl Englund](https://twitter.com/Englundi)
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
Sen är det bara att först installera [Ruby](https://www.ruby-lang.org/en/)
och kila in på [rubyonrails.org](http://rubyonrails.org/) och följa instruktionerna
där.

Först behöver du installera och få igång [*PostgreSQL*](#postgresql-setup). När det är gjort är det bara att sätta igång:

```
bundle install
rake db:migrate
rails server
```

### PostgreSQL setup

Denna applikationen använder sig utav PostgreSQL. Installera och sedan behöver du skapa en en användare och två databaser, följ bara dessa instruktioner:

1. Skapa en databasanvändare som matchar den i [`database.yml`](config/database.yml). Vi använder `vattentornet` som användarnamn, så i psql-terminalen skriver du `CREATE USER vatentornet;`.
2. Ändra lösenordet på användaren: `ALTER USER vattentornet WITH PASSWORD 'tornet';`.
3. Ändra användaren så att den har massa rättigheter `ALTER USER vattentornet SUPERUSER;`.
4. Skapa *development*-databasen `CREATE DATABASE vattentornet_development;`
och *test*-databasen med `CREATE DATABASE vattentornet_test;`.
5. Ändra ägaren genom att köra `ALTER DATABASE vattentornet_development OWNER TO vattentornet;`
and `ALTER DATABASE vattentornet_test OWNER TO vattentornet;`.
6. Klart!

### Lägg till en ny användare

Öppna upp en Rails-konsol genom att köra `rails c` eller `rails console` i din
favorit-terminal. (Se till så att du har migrerat databasen genom att först skriva
`rake db:migrate`.) När Rails-konsolen kommit igång borde det stå något i stil med
`Loading development environment (Rails 4.1.1)`, och då vill du skriva:

```
User.create(:email => 'din@email.se', :admin => true)
```

Följ sedan instruktionerna i rutan som dyker upp. Vipps är det klart!

### BreweryDB – Info om drycker

Vi använder BreweryDB! För att använda detta behöver ni ha tillgång till en API-nyckel
från dem. Gör det genom att gå in [här](http://www.brewerydb.com/developers/apps).
Först, spara api-nyckeln som en miljövariabel i din datta! I din `.bashrc`-fil kan
du exempelvis skriva

```
export BREWERYDB_API_KEY='NYCKEL'
```

Det som är viktigt här är att den heter just `BREWERYDB_API_KEY`, eftersom det är här
rails-appen kommer leta efter nyckeln i `config/initializers/brewery_db.rb`.

Läs mer om gemet [`brewery_db` här](https://github.com/tylerhunt/brewery_db)!

_______

:beers: Livet är för kort för att dricka dålig öl! :beers:
