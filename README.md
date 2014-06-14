PocBank
========================

PocketBank application - Information website for various finance-related products

________________________

##Setup (On MacOS)

To run the application locally, please follow these steps:

```
# Set up the environment to use Ruby 2.1.1
rvm install 2.1.1
source $(rvm 2.1.1 do rvm env —path)

# Setup PostGres Database using HomeBrew (For MacOS). Please refer to this link: 
http://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/

# Install all the Gem
bundle install

# There may be fail installation of all the GEM, please try to run:
brew install qt

# Perform Data Migration
rake db:setup
rake db:seeds

# Run the rail server
rails server

```

##Testing

This app uses Rspec for unit testing & controller testing. 

```
# All the test cases are stored in 
spec/

# Test cases related to the models and controllers will be stored respectively at:
spec/models 
spec/controllers

```

The application use Factory Girl for fixture generation (http://www.hiringthing.com/2012/08/17/rails-testing-factory-girl.html#sthash.kLJvqQRb.dpbs)

```
# Factories are stored at
spec/factories
```

```
# To run all the tests:
bundle exec rspec spec

# To run specific test cases:
bundle exec rspec spec/models/credit_spec.rb

```
________________________

License
