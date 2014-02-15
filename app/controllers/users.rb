require_relative '../helpers/chitter_helper'

class UsersController < Sinatra::Base
	include ChitterHelper
  enable :sessions
  set :views, File.join(File.dirname(__FILE__), '..', '/views')
  set :session_secret, '17051982'
  use Rack::Flash
  use Rack::MethodOverride
	
	get '/users/new' do
  	erb :'users/new'
  end

  post '/users/new' do
  	email, password, password_confirmation, name, username = params[:email], params[:password], params[:password_confirmation], params[:name], params[:username]
  	@user = User.new(email: email, password: password, password_confirmation: password_confirmation, name: name, username: username)
  	if @user.save
      puts 'saved!!'
  		flash[:notice] = "Welcome to chitter, #{username}"
      session[:user_id] = @user.id
      redirect to '/'

    else
    	puts @user.errors.full_messages
    	flash.now[:errors] = @user.errors.full_messages
      erb :"/users/new"
    end
  end
 end