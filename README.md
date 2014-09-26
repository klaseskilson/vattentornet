Vattentornet
=====

En fin hemsida för pub vattentornet i Norrköping.

Vi som pillar på denna sidan är:
 * [Carl Englund](https://twitter.com/Englundi)
 * [Klas Eskilson](https://twitter.com/Eskilicious)
 * [Daniel Rönnkvist](https://twitter.com/trevligheten)

tack pello<3

### BreweryDB

Vi användaer BreweryDB! För att använda detta behöver ni ha tillgång till en API-nyckel
från dem. Gör det genom att gå in [här](http://www.brewerydb.com/developers/apps).
Först, spara api-nyckeln som en miljövariabel i din datta! I din `.bashrc`-fil kan
du exempelvis skriva

```
export BREWERYDB_API_KEY='NYCKEL'
```

Det som är viktigt här är att den heter just `BREWERYDB_API_KEY`, eftersom det är här
rails-appen kommer leta efter nyckeln i `config/initializers/brewery_db.rb`.

Läs mer om gemet [`brewery_db` här](https://github.com/tylerhunt/brewery_db)!
