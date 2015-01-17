require 'sinatra'
require 'singleton'

class UrlCache
  include Singleton

  @links = {}

  def self.get_link(hash)
    @links[hash]
  end

  def self.shorten_link(url)
    @links[url.hash.to_s] = url
    url.hash.to_s
  end
end

get '/:test' do
  UrlCache.get_link(params[:test])
end

get '/shorten/:link' do
  UrlCache.new_link(params[:link])
end