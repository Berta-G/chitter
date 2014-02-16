require 'sinatra/base'
require 'data_mapper'

require_relative 'db_config'
require_relative 'controllers/base'

class ChitterRouter < Sinatra::Base

  Dir.glob(File.join(File.dirname(__FILE__), 'controllers', '*.rb'), &method(:require))

  get('/users/new')  	{Controllers::Users.call(env)}
  post('/users/new')	{Controllers::Users.call(env)}

  post('/sessions')		{Controllers::Sessions.call(env)}

  get('/')						{Controllers::Peeps.call(env)}
  post('/peeps/post') {Controllers::Peeps.call(env)}

  # start the server if ruby file executed directly
  run! if app_file == $0

end


