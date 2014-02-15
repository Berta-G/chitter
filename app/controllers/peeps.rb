class Peeps < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__), '..', '/views')
	enable :sessions
  set :session_secret, '17051982'
  use Rack::Flash
  use Rack::MethodOverride

	get '/' do
		@peeps = []
		erb :index
	end

end