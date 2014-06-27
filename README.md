# NapaPagination

A simple pagination representer & results orderer for Napa

## Installation

Add this line to your application's Gemfile:

    gem 'napa_pagination'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install napa_pagination


# Pagination

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
    people = Person.filter(declared(params.except(:per_page), include_missing: false))
    # represent people, with: PersonRepresenter
    paginate people, with: PersonRepresenter
  end

  ...
end
```

# Results Ordering

Once the gem is installed, and you've replaced `represent` with the `paginate you'll just need to add one api paremeters `:sort_by`

```ruby
class PeopleApi < Grape::API
  desc 'Get a list of people'
  params do
    optional :ids, 
             type: String, 
             desc: 'comma separated person ids'
    optional :sort_by, 
             type: Symbol,
             desc: 'the key to sort the results by',
             values: [:id, :name, :age]
  end
  get do

    people = Person.filter(declared(params.except(:sort_by), include_missing: false))
    represent people, with: PersonRepresenter
  end

  ...
end
```
 ```ruby
class PeopleApi < Grape::API
  desc 'Get a list of people'
  params do
    optional :ids, 
             type: String, 
             desc: 'comma separated person ids'
    optional :sort_by, 
             type: Symbol,
             desc: 'the key to sort the results by',
             values: [:id, :name, :age]
    optional :sort_order,
             type: Symbol,
             desc: 'the order to sort the results by',
             values: [:asc, :desc]
  end
  get do
    people = Person.filter(declared(params.except(:sort_by, :sort_order), include_missing: false))
    order_by_params!(people)

    represent people, with: PersonRepresenter
  end

  ...
end
```

You can also change the order in which the sort happens by providing a `sort_order` parameter. By default this will be ascending. 

## Contributing

1. Fork it ( http://github.com/<my-github-username>/napa_pagination/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
