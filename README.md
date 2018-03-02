# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Usage

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Create .env file based on .env.example
5. Sign up for a Stripe account
6. Put Stripe (test) keys into appropriate .env vars
7. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Screenshots

!["Screenshot of Catalogue](https://github.com/shaytopaze/jungle-rails/blob/master/docs/catalogue.png?raw=true)
!["Screenshot of Product Details"](https://github.com/shaytopaze/jungle-rails/blob/master/docs/details.png?raw=true)
!["Screenshot of Create Review"](https://github.com/shaytopaze/jungle-rails/blob/master/docs/createReview.png?raw=true)
!["Screenshot of List of Reviews"](https://github.com/shaytopaze/jungle-rails/blob/master/docs/reviewList.png?raw=true)
!["Screenshot of My Cart"](https://github.com/shaytopaze/jungle-rails/blob/master/docs/myCart.png?raw=true)

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
