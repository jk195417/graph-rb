# Graph

A ruby gem for graph, data structure. https://rubygems.org/gems/graph-rb

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'graph-rb', require: 'graph'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install graph-rb

## Usage

```ruby
require 'graph'

graph = Graph.new
vertex1 = Graph::Vertex.new
vertex2 = Graph::Vertex.new
vertex3 = Graph::Vertex.new
edge1 = Graph::Edge.new(vertex1, vertex2)
edge2 = Graph::Edge.new(vertex1, vertex3)
edge3 = Graph::Edge.new(vertex2, vertex3)

# add vertex or edge to graph
graph << vertex1
graph << edge3

# delete vertex or edge to graph
graph.delete edge3
graph.delete vertex1

# show graph in a hash
graph.to_h
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jk195417/graph-rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Graph project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jk195417/graph-rb/blob/master/CODE_OF_CONDUCT.md).
