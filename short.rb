require 'sinatra'
require './url_cache'

set :public_folder, './public'

get '/' do
  send_file "public/index.html"
end

get '/:hash' do
  url = UrlCache.get_link(params[:hash])
  not_found unless url
  redirect url, 301
end

post '/shorten' do
  UrlCache.shorten_link(params[:link])
end
