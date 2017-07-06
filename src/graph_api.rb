require 'yaml'
require 'koala'

class GraphApi
  def initialize
    fb_config = YAML.load(File.open('facebook.yml'))

    @access_token = fb_config['access_token']
    @graph = Koala::Facebook::API.new(@access_token)
  end

  def about_me
    @graph.get_object('me')
  end

  def post_message(message)
    @graph.put_wall_post(message)
  end

  def post_img(file, message)
    @graph.put_picture(file, {'message': message})
  end
end