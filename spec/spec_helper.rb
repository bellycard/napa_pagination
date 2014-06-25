require 'napa_pagination'
require 'pry'

RSpec.configure do |config|
  config.before(:all) do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

    ActiveRecord::Schema.define(version: 1) do
      create_table :foos do |t|
        t.string :word
      end
    end

    class Foo < ActiveRecord::Base
    end

    class FooRepresenter < Napa::Representer
      property :word, type: String
    end
  end
end
