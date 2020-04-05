# README

Ruby on Rails 

Show-off Tech Test

* Ruby version : 2.6.5
* Rails version: 6.0.2.2
* Database : PostgreSQL
* Heroku: 
https://polar-oasis-32422.herokuapp.com/

Deloyment steps:

* bundle install
* Add database information to credentials.yml.enc: `EDITOR=vim rails credentials:edit`
* Edit webpacker.yml ,set `extract_css: true`
* Run: `RAILS_ENV=production rails assets:precompile`
* Run: `RAILS_ENV=production rails s`

Run test:
* `rails test:system`
