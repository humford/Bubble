require "./config/environment"
require "./app/models/bubble_post"
require "./app/models/bubble"
require "./app/models/comment"
require "./app/models/membership"
require "./app/models/post"
require "./app/models/user"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
	 enable :sessions
    set :session_secret, "Chattr"
  end

  get "/" do
	  erb :index
  end
  
  get "/signup" do
    erb :signup
  end

  get "/navbar" do
	  erb :navbar
  end

  post "/new_user" do
	 @user = User.new({:username => params[:username], :email => params[:email], :password => params[:password]})
    @user.save
    redirect "/"
  end

  post "/login" do
	 @user = User.find_by({:username => params[:username], :password => params[:password]})
    if @user #exists
      #start session
      session[:user_id] = @user.id
	 else
      #throw an error
      @account_fail = true
		puts "LOGIN FAILED"
#      redirect "/"
    end
#    redirect "/profile/#{@user.id}"
	 redirect "/"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  get "/login_form" do
	  erb :loginform
  end

end

