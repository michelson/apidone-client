# Apidone::Client

ApiDone ruby client.

## Installation

Add this line to your application's Gemfile:

    gem 'apidone-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apidone-client

## Usage

### Usage in scripts
  
#### init connection:
  
    @conn = Apidone::Client::Connection.new("dojoruby")

#### Create a resource:  
  
    @c.create("lenguajes")
  
#### List resources
  
    @c.list("lenguajes")
  
#### Edit , delete & show resources:

    @c.update("lenjuages", "someid", {:name=>"ruby", :versions=>["1.8.7", "Ree", "rbx"]})
  
    @c.delete("lenjuages", "someid")
  
    @c.show("lenjuages", "someid")
    
## Command line
  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
