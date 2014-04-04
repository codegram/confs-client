# Confs

Gem to fetch data from our Conferences stored at Codegram Conferences.

## Installation

Add this line to your application's Gemfile:

    gem 'confs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install confs

## Usage


Add an initializer with the API access data on your new project:

```ruby
  Confs.config.conference_name  = 'YOUR_ACCESS_NAME'
  Confs.config.conference_token = 'YOUR_ACCESS_TOKEN'
```

To initialize the client use `Confs::Client.new`, you would
typically do as follows:

```ruby
  def client
    @client ||= Confs::Client.new
  end
```

To fetch each collection you just need a single call to fetch any collection
now:

```ruby
  client.speakers   #returns a Speaker collection
  client.talks      #returns a Talk collection
  client.workshops  #returns a Workshop collection
  client.events     #returns a Event collection
  client.posts      #returns a Post collection
  client.job_offers #returns a JobOffer collection
  client.sponsors   #returns a Sponsor collection
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
