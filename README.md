# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version
```
2.6.1
```

* System dependencies
```
postgresql
redis
```

* Configuration
```
cd task_management
bundle install
cp .env.example .env
vi .env
```
then update your postgresql host, username and password

* Database creation
```
bundle exec rake db:create

bundle exec rake db:schema:load
bundle exec rake db:schema:load RAILS_ENV=test
```

* How to run the test suite
```
bundle exec rspec spec/
```
