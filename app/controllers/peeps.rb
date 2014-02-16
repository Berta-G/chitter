require_relative '../helpers/chitter_helper'
require 'sinatra/partial' 

class PeepsController < Sinatra::Base
	include ChitterHelper
	enable :sessions
	set :views, File.join(File.dirname(__FILE__), '..', '/views')
  set :session_secret, '17051982'
  set :partial_template_engine, :erb
  use Rack::Flash
  use Rack::MethodOverride

	get '/' do
		@peeps = Peep.all(:order => [:updated_at.desc ]) || []
		erb :index
	end

	post '/peeps/post' do
		title, text, user = params[:peep_title], params[:peep_text], current_user
		puts title + text + user.name
		Peep.create(title: title, text: text, user: user)
		redirect '/'
	end


end