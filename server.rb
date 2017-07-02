require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'builder'
require 'pry'
require 'sequel'

configure do
  DB = Sequel.connect('sqlite://rss.db')

  class RssPost < Sequel::Model
  end
end

get '/' do
  @posts = RssPost.all
  builder :rss
end

get '/rsspost/new' do
  erb :'rsspost/new'
end

post '/rssposts' do
  p params

  title   = params['title']
  link    = params['link'] # TDOO: Maybe blog or FB fans page
  content = params['content']
  img_url = params['img_url'] # TODO: img path

  # TODO: Insert into db
  # builder :rss
end
