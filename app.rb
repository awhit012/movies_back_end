require 'sinatra'
require 'json'
require 'httparty'

get '/' do
  File.read(File.join('./views', 'index.html'))
  # HTTParty.get('http://www.omdbapi.com/?s=hello&y=&plot=short&r=json')
end

get '/favorites' do
  response['Access-Control-Allow-Origin'] = '*'
  response.header['Content-Type'] = 'application/json'
  File.read('data.json')
end

post '/favorite' do
  # response['Access-Control-Allow-Origin'] = 'http://domain.com'

  request['Access-Control-Request-Method'] = '*'
  request['Access-Control-Allow-Origin'] = '*'
  response['Access-Control-Allow-Origin'] = '*'
  request['Access-Control-Allow-Origin'] = 'file:///Users/awhit012/Desktop/instructor-code-challenge-master/js-frontend/index.html'
  response['Access-Control-Allow-Origin'] = 'file:///Users/awhit012/Desktop/instructor-code-challenge-master/js-frontend/index.html'

  response['Access-Control-Allow-Methods'] = 'POST, OPTIONS'
  response['Access-Control-Request-Method'] = '*'
  response['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'



  content_type :json
  # p JSON.parse(response.body.read)
  p response
  p params
  p params.to_json

  # file = JSON.parse(File.read('data.json'))
  # return 'Invalid Request' unless params[:name] && params[:oid]
  # movie = { name: params[:name], oid: params[:oid] }
  # file << movie
  # File.write('data.json',JSON.pretty_generate(file))
  # movie.to_json
end
