require 'sinatra'
require 'json'

before do
  # headers 'Access-Control-Allow-Origin' => 'http://awhit012.github.io'
  headers 'Access-Control-Allow-Origin' => *

end

get '/' do
  File.read(File.join('./views', 'index.html'))
end

get '/favorites' do
  response.header['Content-Type'] = 'application/json'
  File.read('data.json')
end

post '/favorite' do
  data = JSON.parse(request.body.read)
  p data
  file = JSON.parse(File.read('data.json'))
  return 'Invalid Request' unless data['name'] && data['oid']
  file[data['name']] = data['oid']
  File.write('data.json', JSON.pretty_generate(file))
  data
end


