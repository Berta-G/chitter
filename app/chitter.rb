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

	require_relative 'controllers/users'
  get('/users/new')  	{UsersController.call(env)}
  post('/users/new')	{UsersController.call(env)}

  require_relative 'controllers/sessions'
  get('/sessions/new') 	{SessionsController.call(env)}
  post('/sessions')			{SessionsController.call(env)}


  require_relative 'controllers/peeps'
  get('/')							{PeepsController.call(env)}

  # start the server if ruby file executed directly
  run! if app_file == $0

  
end


