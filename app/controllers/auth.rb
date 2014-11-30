Tod::App.controllers :auth do
	get :github_callback, :map => "/auth/github/callback" do
  		omniauth = request.env["omniauth.auth"]

	    @user = User.find_uid(omniauth["uid"])
	    @user = User.new_from_omniauth(omniauth) if @user.nil?

	    # save @user into your session to say he's authenticated
	    session[:user_id] = @user.id

	    redirect url("/")
	end

	get :github_callback_failed, :map => "/auth/failure" do
		flash[:error] = "Error logging with github.com #{params[:message]}"
	    redirect url("/")
	end

	get :log_out do
		session[:user_id] = nil
		redirect url("/")
	end
end
