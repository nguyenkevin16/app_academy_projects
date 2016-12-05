require 'addressable/uri'
require 'rest-client'

# bin/my_script.rb
def index_users
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

  puts RestClient.get(url)
end

def get_users
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html?var1=val1'
  ).to_s

  puts RestClient.get(url)
end

def nesting_parameters
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/5.json',
  query_values: {
    'some_category[a_key]' => 'another value',
    'some_category[a_second_key]' => 'yet another value',
    'some_category[inner_inner_hash][key]' => 'value',
    'something_else' => 'aaahhhhh'
  }
  ).to_s

  puts RestClient.post(url)
end

if __FILE__ == $0
  # index_users
  # get_users
  nesting_parameters
end
