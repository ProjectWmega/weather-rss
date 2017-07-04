require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'builder'
require 'pry'
require 'sequel'

DB = Sequel.connect('sqlite://rss.db')

class RssPost < Sequel::Model
end

get '/' do
  @posts = RssPost.all
  builder :rss
end

get '/rsspost/new' do
  erb :'rsspost/new'
end

post '/rssposts' do
  file_path = saving_img(params[:image][:tempfile])

  # Insert into db
  DB[:rss_posts].insert({
    :title   => params['title'],
    :link    => 'google.com', # TDOO: Maybe blog or FB fans page
    :content => params['content'],
    :img_url => file_path
  })

  @posts = RssPost.all
  builder :rss
end

def saving_img(img_data)
  file_path = "./images/#{Time.new.strftime '%Y%m%d%H%M%S'}.png"  
  File.open(file_path, 'wb') do |f|
    f.write(img_data.read)
  end

  return file_path
end
