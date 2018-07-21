# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example. Users
can create an account, login and buy items. Users should receive an email confirmation with their order #.
Logged in users can add reviews and ratings to products.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Sign up for a Stripe account
4. Put Stripe (test) keys into appropriate .env vars
5. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Final Product

!["Screenshot of Jungle"](https://github.com/cristianeams/jungle-rails/blob/master/docs/Screen%20Shot%202018-07-20%20at%205.13.54%20PM.png?raw=true)
!["Screenshot of order page"](https://github.com/cristianeams/jungle-rails/blob/master/docs/Screen%20Shot%202018-07-20%20at%205.14.33%20PM.png?raw=true)
