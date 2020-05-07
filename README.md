# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning rails. The core project was inherited from a Lighthouse Labs template.

Added features/fixes inculde:
- Product stock indicators
- Price Formatting
- Admin console dashboard, category and sales pages
- Admin console basic HTTP Authentication
- User login, registration and authentication using bcrypt
- Site wide sales that impact product price
- Completed Order display and order indexing by user
- Static about page
- product inventory updates based on orders

The project has been hosted at https://guarded-meadow-74842.herokuapp.com/ for demonstration purposes.

Note: Admin console is accessable with the default username and password shown in the example .env file.

## Final Product

!["Appointment Display"](https://raw.githubusercontent.com/jeff-sexton/scheduler/master/docs/Appointment_display.png)
!["Booking Interview"](https://raw.githubusercontent.com/jeff-sexton/scheduler/master/docs/Booking_interview.png)
!["Edit or Delete Interview"](https://raw.githubusercontent.com/jeff-sexton/scheduler/master/docs/EditDelete_interview.png)
!["Delete Confirmation"](https://raw.githubusercontent.com/jeff-sexton/scheduler/master/docs/Delete_confirmation.png)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* bcrypt
* bootstrap-sass
* font-awesome-rails
* money-rails
* carrierwave
* rmagick

## Development & Testing Dependencies

* capybara
* poltergeist
* database_cleaner
* dotenv-rails
* rspec-rails
* faker

## Possible Future Features

* Email order confirmations
* Product Reviews & Comments 