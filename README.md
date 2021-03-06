# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

![Home Page](https://github.com/dleard/jungle-rails/blob/master/pictures/home.png)
![Product Page w/ reviews](https://github.com/dleard/jungle-rails/blob/master/pictures/product_review.png)

## Setup

2. Run `bundle install` to install dependencies
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Bcrypt