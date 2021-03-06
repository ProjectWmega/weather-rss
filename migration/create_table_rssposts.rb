require 'sequel'

DB = Sequel.connect('sqlite://rss.db')

DB.create_table :rss_posts do
  primary_key :id
  String :title
  text :content
  String :link
  String :img_url
  timestamp :created_at, :default => Sequel::CURRENT_TIMESTAMP
end