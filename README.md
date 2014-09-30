# Friend List

## Introduction

This is an application for a social network. It was built with the following
technologies and frameworks:

* Back-end
  * Rails
  * Postgresql

* Front-end
  * Haml
  * Sass
  * Angular.js

* Testing
  * Rspec
  * Capybara

* Deployment
  * Heroku


## Set up locally

In order to get this project working locally, you have to install the
following:

  * Git
  * [RVM](http://rvm.io/rvm/install)
  * Postgresql

I recommend installing these ones with Homebrew. It's super easy

Once you have finished, clone the repo to your machine. Automatically, it will
set the gemset that is in the repo.

Now, execute **bundle install** to install all the dependent gems of the
project.

Then, you must have to create a copy of the file **database.yml** with this
name **database.local.yml** using as example the **database.yml** to set up
your username and password of your database in postgresql.

Finally, run this command **rake db:create && rake db:migrate && rake
create_members_with_friends:create_members** to create the database of the
project, run the migrations (create the tables with the fields) and fill them
with some seed values

Execute *rails server* and voilà

To run the tests you should execute *rake spec*. The green dots mean that the
tests passed and the red ones mean that failed.
