require 'sinatra'
require 'sinatra/partial'
require 'date'
require 'newrelic_rpm'

require './models/photo'
require './models/song'
require './models/project'

class TrippRoberts < Sinatra::Application

  CALLBACK_URL = "http://tripp-roberts.com/oauth/callback"

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

  #get "/oauth/connect" do
  #  PhotoService.configure_service
  #  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  #end

  #get "/oauth/callback" do
  #  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  #  File.write('./tokens/access_token.txt', response.access_token)
  #  redirect "/"
  #end

  get '/resume' do
    send_file 'public/files/jack_roberts_resume_15_8_8.pdf'
  end

  get '/music' do
    @title = "Music - Tripp Roberts"
    @songs = Song.recent(3)
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
