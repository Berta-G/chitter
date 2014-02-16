module Controllers

  class Sessions < Base

    post '/sessions' do
    	user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/'
      else
        flash[:errors] = ["Incorrect username or password"]
        redirect '/'
      end
    end

    delete '/sessions' do
      flash[:notice] = "Goodbye, #{current_user}!"
      session[:user_id] = nil
      redirect '/'
    end
    
  end
end
