# NapaPagination

A simple pagination representer for Napa

## Installation

Add this line to your application's Gemfile:

    gem 'napa_pagination'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install napa_pagination

## Usage
Once you have the gem installed, simply replace `represent` with the `paginate` when returning the response from your API. Below is an example based on the [Napa Quickstart Guide](https://github.com/bellycard/napa/blob/master/docs/quickstart.md).

```ruby
class PeopleApi < Grape::API
  desc 'Get a list of people'
  params do
    optional :ids, type: String, desc: 'comma separated person ids'
  end
  get do
    people = Person.filter(declared(params, include_missing: false))
    # represent people, with: PersonRepresenter
    paginate people, with: PersonRepresenter
  end

  ...
end
```

By default, this will default to 25 results per page. If you want to change that you can pass in an override in the params block:

```ruby
class PeopleApi < Grape::API
  desc 'Get a list of people'
  params do
    optional :ids, type: String, desc: 'comma separated person ids'
    optional :per_page, type: Integer, desc: 'Results per page', default: 100
  end
  get do
    people = Person.filter(declared(params, include_missing: false))
    # represent people, with: PersonRepresenter
    paginate people, with: PersonRepresenter
  end

  ...
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/napa_pagination/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
