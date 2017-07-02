require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'builder'
require 'pry'
require 'sequel'

before do
  DB = Sequel.connect('sqlite://rss.db')
  @rss = DB[:rssposts]
end

get '/' do
  @posts = @rss.all
  builder :rss
end

get '/rsspost/new' do
  erb :'rsspost/new'
end

post '/rssposts' do
  title   = params['title']
  link    = params['link'] # TDOO: Maybe blog or FB fans page
  content = params['content']
  img_url = params['img_url'] # TODO: img path

  # TODO: Insert into db
  builder :rss
end
