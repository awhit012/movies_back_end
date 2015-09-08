require 'sinatra'
require 'json'
require 'httparty'
require 'sinatra/cross_origin'
require 'sinatra/multi_route'


configure do
  enable :cross_origin
end

get '/' do
  File.read(File.join('./views', 'index.html'))
  # HTTParty.get('http://www.omdbapi.com/?s=hello&y=&plot=short&r=json')
end

get '/favorites' do
  response.header['Content-Type'] = 'application/json'
  File.read('data.json')
end

route :post, :options, '/favorite' do
  content_type :json
  p response
  p params

  # file = JSON.parse(File.read('data.json'))
  # return 'Invalid Request' unless params[:name] && params[:oid]
  # movie = { name: params[:name], oid: params[:oid] }
  # file << movie
  # File.write('data.json',JSON.pretty_generate(file))
  # movie.to_json
end


