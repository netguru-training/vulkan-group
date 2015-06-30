# Vulkan-group

## General information

  Vulcan is an application created during Netguru workshops in Cracow. Our application is an online shop that allows customers to search and select products for purchase. There is also possibility to pay for orders using credit card or paypal account and share favorite products on facebook.

## Technologies

* Ruby: 2.2.1
* Ruby on Rails: 4.2.1
* Devise (User authentication)
* Active Admin (Administration)
* Elasticsearch (Searching engine)
* PostgreSQL
* CarrierWave (Images upload)
* Braintree (Payment system)
* Bootstrap
* Haml

## Setup (Debian based distributions)

### Basic setup

Clone repository:
```sh
git clone git@github.com:netguru-training/vulkan-group.git
```

Run:
```sh
bundle install
```

Setup database:
```sh
rake db:setup
```

And start server:
```sh
rails s
```

To sign in use default admin account or register regular user account:
```
login: admin@example.com
password: password
```

### ImageMagick

Simply type the following command to start ImageMagick installation:
```sh
sudo apt-get install libmagickwand-dev imagemagick
```

### Braintree

Create sandbox account on Braintree:

https://www.braintreepayments.com/get-started

then change api keys and merchant id in config/environments/development.rb file

### Elasticsearch

Download script from website:

https://gist.github.com/ricardo-rossi/8265589463915837429d

and run as root user:
```sh
sudo ./Elasticsearch.sh 1.4.4
```
