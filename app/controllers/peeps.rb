module Controllers

	class Peeps < Base
		
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
end