require 'sinatra'
require 'sinatra/partial'
require 'sinatra_autoload'

class TrippRoberts < Sinatra::Base

  get '/' do
    @photos = Photo.recent(2)
    @songs = Song.recent(2)
    @websites = Website.recent(2)
    erb :home
  end

  get '/resume' do
    send_file 'public/files/jack_roberts_resume.pdf'
  end

  not_found do
    halt 404, 'Page not found'
  end

end
