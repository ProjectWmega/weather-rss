xml.instruct! :xml, :version => '1.0'
xml.rss :version => "2.0" do
  xml.channel do
    xml.title 'Real Time Weather'
    xml.description 'Description'
    xml.link 'Our Websit'

    @posts.each do |post|
      xml.item do
        xml.title       post[:title]
        xml.link        post[:link]
        xml.pubDate     Time.parse(post[:created_at].to_s).rfc822()
        xml.description post[:description]
        xml.img         'src': post[:img_url]
      end
    end
  end
end