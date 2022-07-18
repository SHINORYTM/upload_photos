# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
   * 3.0.2

* Getting Started
  * gem install bundler
  * git clone https://github.com/SHINORYTM/upload_photos.git
  * bundle install
  * bundle exec rails db:migrate
  * bundle exec rails db:seed
  * bundle exec rails s
    * login with login_id is user and password is password

* System dependencies

* Configuration
  * set environment variables
  * export OAUTH_URI=「oauth authorize uri」
  * export OAUTH_CLIENT_ID=「client_id」
  * export OAUTH_CLIENT_SECRET=「client_secret」
  * export OAUTH_RESPONSE_TYPE="code"
  * export OAUTH_REDIRECT_URI="http://localhost:3000/oauth/callback"
  * export OAUTH_GRANT_TYPE="authorization_code"
  * export OAUTH_TOKEN_URI=「oauth token uri」
  * export OAUTH_TWEET_URI=「api tweets uri」

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
