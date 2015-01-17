require 'sinatra'
require 'singleton'

class UrlCache
  include Singleton

  @links = {"aa1" => "http://google.fi"}
  @last_hash = "aa1"

  def self.get_link(hash)
    puts @links
    @links[hash]
  end

  def self.shorten_link(url)
    @last_hash = @last_hash.next
    @links[@last_hash] = url
    @last_hash
  end
end

get '/:hash' do
  url = UrlCache.get_link(params[:hash])
  not_found unless url
  redirect url, 301
end

post '/shorten' do
  UrlCache.shorten_link(params[:link])
end