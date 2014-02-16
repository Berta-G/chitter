require_relative '../helpers/chitter_helper'
require 'sinatra/partial' 

class SessionsController < Sinatra::Base
	include ChitterHelper
	enable :sessions
	set :views, File.join(File.dirname(__FILE__), '..', '/views')
  set :session_secret, '17051982'
  use Rack::Flash
  use Rack::MethodOverride

  # get '/sessions/new' do
  # 	erb :'sessions/new'
  # end

  post '/sessions' do
  	user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = ["Incorrect username or password"]
      redirect '/'
    end
  end

  delete '/sessions' do
    flash[:notice] = "Goodbye, #{current_user}!"
    session[:user_id] = nil
    redirect '/'
  end
end
