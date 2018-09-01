# StoreFront

A simple marketplace rails app where users can create new orders, add/edit/remove products to the order, and present the user a final invoice showing the total price of
purchase. (Payment and Authentication is not included).

### Requirements
1. Ruby version 2.5.1
2. Rails version 5.2.1
3. Bundler version 1.16.1
4. PosgreSql >=9.6.10

#### Technology Used
* Framework
    1. Ruby on Rails
* Development and testing
    1. SimpleCov for test coverage (approx. 97%)
    2. Rubocop
    3. Capybara
    4. Rspec-Rails
    5. PostgreSql(Database)
    
#### Setting up
1. run `git clone git@github.com:tomily1/StoreFront.git`
2. `cd` into the root folder (StoreFront/)
3. Install dependencies by running `bundle install`
4. run `rails db:create` to create database
5. run `rails db:migrate` to run migrations
4. To seed the database with sample data, run rake task `rake storefront:seed:create` (OPTIONAL)
5. run the application by running `rails server` command at the root folder in the console
6. open brower and go to `localhost:3000` to view the app

#### How to run Test
1. Follow step `1 - 5` above in setting up the app.
2. run `rspec` command at the root directory in the console.

#### How to use the application (quick look)
After setting up  the app and running the server,
1. If you seed the database, you don't need to create new delivery method or products
2. If not, products can be created by clicking the `Create Product` link in the navigation bar.
3. Delivery Methods can be added by created as well as deleted by clicking the `Delivery Methods` link on the navigation bar
4. To add products to cart, go to the root path and click add to cart
5. To view cart, goto `/carts` or click the Cart icon on the top right side on the navigation bar.
6. Total cost is the sum of shipping, total product price, and tax

**N.B.** You have to select shipping method to be able to view the total charge and make payments. Also, delivery methods that are in use cannot be deleted.