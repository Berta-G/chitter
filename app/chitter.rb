require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './app/models/user'
DataMapper.auto_upgrade!
DataMapper.finalize

class Chitter < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__), 'views')


  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
  	erb :'users/new'
  end

  post '/users/new' do
  	'Welcome to chitter, Pepe'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
