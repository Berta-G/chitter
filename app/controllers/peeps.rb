require_relative '../helpers/chitter_helper'

class PeepsController < Sinatra::Base
	include ChitterHelper
	enable :sessions
	set :views, File.join(File.dirname(__FILE__), '..', '/views')
  set :session_secret, '17051982'
  use Rack::Flash
  use Rack::MethodOverride

	get '/' do
		@peeps = []
		erb :index
	end

	post '/peeps/post' do
		title, text, user = params[:peep_title], params[:peep_text], current_user
		puts title + text + user.name
		Peep.create(title: title, text: text, user: user)
	end


end