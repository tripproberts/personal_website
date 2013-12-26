require 'sinatra'
require 'shotgun'

get '/' do
  erb :home
end

get '/resume' do
  send_file './files/jack_roberts_resume.pdf'
end

not_found do
  halt 404, 'Page not found'
end
