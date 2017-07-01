require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'builder'
require 'pry'

get '/' do
  # TODO: @posts will get all posts  
  builder :rss
end

get '/rsspost/new' do
  erb :'rsspost/new'
end

post '/rssposts' do
  @posts = []
  title   = params['title']
  link    = params['link'] # TDOO: Maybe blog or FB fans page
  content = params['content']
  img_url = params['img_url'] # TODO: img path

  # TODO: Insert into db
  builder :rss
end
