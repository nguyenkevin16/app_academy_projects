require 'json'

class Flash
  def initialize(req)
    cookies = req.cookies

    if cookies.key?('_rails_lite_app_flash')
      @flash = JSON.parse(cookies['_rails_lite_app_flash'])
    else
      @flash = Hash.new
    end
  end

  def [](key)
    @flash[key.to_s]
  end

  def []=(key, value)
    @flash[key.to_s] = value
  end

  def now

  end

  def store_flash(req)
    req.set_cookie(:_rails_lite_app_flash, path: :/, value: @flash.to_json)
  end
end
