# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

rails new entrega

bundle install

rails generate scaffold Sender name:string telephone:string email:string \
    address:string latitude:float longitude:float status:integer

rails generate scaffold Company name:string telephone:string email:string \
    address:string latitude:float longitude:float radius:integer status:integer

rails generate scaffold Transporter name:string telephone:string email:string \
    status:integer company:belongs_to

rails generate scaffold Order description:text weight:decimal \
    length:decimal width:decimal heigth:decimal \
    pickup_address:string pu_lat:float pu_lng:float pu_time:datetime \
    delivery_address:string dy_lat:float dy_lng:float dy_time:datetime \
    cost:decimal status:integer radius:integer \
    sender:belongs_to transporter:belongs_to

rails generate model OrderStatus status:integer status_time:timestamp \
    status_details:text order:belongs_to

rails db:migrate
rails db:seed

gem 'geocoder'
rails generate geocoder:config

git remote add origin https://github.com/mariomc2/entrega.git
git add .
git commit -m "Inicial"
git push -u origin master
