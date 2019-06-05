Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


INITIAL SETUP
Last updated: 5 June
Updated by (github name): haokevinchen

Step 1 - Pull master
  git pull master

Step 2 - Intalling gems
  bundle install
  yarn install

Step 3 - Configure database
  may need to restart pg server if you encounter cannot find file error
    pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
  rails db:create
  rails db:migrate
  rails db:seed
