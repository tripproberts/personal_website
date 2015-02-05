require 'sinatra'
require 'sinatra/partial'
require 'date'
require 'newrelic_rpm'

require './models/photo'
require './models/song'
require './models/project'

class TrippRoberts < Sinatra::Application

  helpers do
    def format_date(date)
      DateTime.parse(date).strftime('%B %e, %Y')
    end
  end

  get '/' do
    @title = "Tripp Roberts"
    @photos = Photo.recent(3)
    erb :home
  end

  get '/resume' do
    send_file 'public/files/jack_roberts_resume.pdf'
  end

  get '/music' do
    @title = "Music - Tripp Roberts"
    @songs = Song.recent(2)
    erb :music
  end

  get '/projects' do
    @title = "Projects - Tripp Roberts"
    @projects = Project.recent(2)
    erb :projects
  end

  not_found do
    halt 404, 'Page not found'
  end

end
