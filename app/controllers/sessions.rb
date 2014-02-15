require_relative '../helpers/chitter_helper'

class SessionsController < Sinatra::Base
	include ChitterHelper
	enable :sessions
	set :views, File.join(File.dirname(__FILE__), '..', '/views')
  set :session_secret, '17051982'
  use Rack::Flash
  use Rack::MethodOverride

  get '/sessions/new' do
  	erb :'sessions/new'
  end

  post '/sessions' do
  	user = User.authenticate(params[:username], params[:password])
    if user
    	puts "USER"
      session[:user_id] = user.id
      redirect '/'
    else
    	puts "NO USER"
      flash[:errors] = ["Incorrect mail or password"]
      redirect '/sessions/new'
    end
  end
end