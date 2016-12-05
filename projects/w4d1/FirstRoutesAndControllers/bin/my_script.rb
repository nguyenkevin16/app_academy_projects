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

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
end

def delete_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users'
  ).to_s

  puts RestClient.delete(
    # url + '/4'
  )
end

if __FILE__ == $0
  index_users
  # create_user("Gizmo", "gizmo@gizmo.gizmo")
  # delete_user("Gizmo", "gizmo@gizmo.gizmo")
  # index_users
end
