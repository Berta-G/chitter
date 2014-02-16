require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './app/models/user'
require './app/models/peep'
DataMapper.auto_upgrade!
DataMapper.finalize

class Chitter < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__), 'views')
  set :partial_template_engine, :erb

	require_relative 'controllers/users'
  get('/users/new')  	{UsersController.call(env)}
  post('/users/new')	{UsersController.call(env)}

  require_relative 'controllers/sessions'
  post('/sessions')		{SessionsController.call(env)}

  require_relative 'controllers/peeps'
  get('/')						{PeepsController.call(env)}
  post('/peeps/post') {PeepsController.call(env)}

  # start the server if ruby file executed directly
  run! if app_file == $0

  
end


