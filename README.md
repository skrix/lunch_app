# Lunch Ordering App on Ruby on Rails
### The test project about lunch ordering.
[![Coverage Status](https://coveralls.io/repos/github/skrix/lunch_app/badge.svg)](https://coveralls.io/github/skrix/lunch_app)

## Usage:
  * Fill config/database.yml and config/application.yml;

  * Execute next commands:

        rake db:create db:migrate seed:migrate

System can access orders list to api by /api/v1/orders.json?access_token=<your_access_token>
