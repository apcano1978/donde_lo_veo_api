# README

### Installation instructions

##### Ruby version: 3.0.0
##### Rails version: 6.1.1
##### Database adapter: Postgresql

#### Installation steps:
* Install, preferibly via rvm, Ruby version 3.0.0 using `rvm install 3.0.0`
* Clone this repository into your local machine
* Enter donde_lo_veo folder and run `bundle install` all gems must successfully install into your local machine
* Run `rails db:create && rails db:migrate` in order to create development and test databases and migrate all models into the database you´ve just created
* Run `rails db:seed`in order to seed the database with some necessary records like base roles and so on.
* Run `rails s`, now donde_lo_veo api is accessible via localhost:3000, to access it in development environment is highly recommended using postman app
