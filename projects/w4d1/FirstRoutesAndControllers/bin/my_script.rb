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

if __FILE__ == $0
  index_users
end
