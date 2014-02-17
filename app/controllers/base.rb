require_relative '../helpers/chitter_helper'
require 'sinatra/partial' 
require 'rack-flash'

module Controllers

  class Base < Sinatra::Base
		helpers ChitterHelper

		enable :sessions
		
		use Rack::Flash
  	use Rack::MethodOverride
		
		set :views, File.join(File.dirname(__FILE__), '..', '/views')
		set :public_folder, File.join(File.dirname(__FILE__), '..', '..', '/public')
  	set :session_secret, '17051982'
  	set :partial_template_engine, :erb
  	
  end
end
