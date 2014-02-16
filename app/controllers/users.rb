module Controllers

  class Users < Base
	
  	get '/users/new' do
    	erb :'users/new'
    end

    post '/users/new' do
    	email, password, password_confirmation, name, username = params[:email], params[:password], params[:password_confirmation], params[:name], params[:username]
    	@user = User.new(email: email, password: password, password_confirmation: password_confirmation, name: name, username: username)
    	if @user.save
        session[:user_id] = @user.id
        redirect to '/'

      else
      	puts @user.errors.full_messages
      	flash.now[:errors] = @user.errors.full_messages
        erb :"/users/new"
      end
    end
    
  end
end