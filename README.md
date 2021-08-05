# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version：2.6.5

* Database

* rails g model user name email password_digest session_token isadmin:boolean

* rails g model task name content state:integer priority:integer user:belongs_to end_date:datetime

* rails g model tag name

* rails g model tag_task task:belongs_to tag:belongs_to

* 佈署至 heroku 

Install:
run bundle install.

Migrations:
rake db:migrate
