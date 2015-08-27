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

  get "/profile/:id" do
    @user = User.find_by({:id => params[:id]})
#    @user_tweets = Tweet.where({:user_id => params[:id]})
    erb :profile
  end

  get "/bubble/:id" do
	  @bubble = Bubble.find_by({:id => params[:id]})
	  erb :bubble
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
      redirect "/"
    end
    redirect "/profile/#{@user.id}"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  get "/login_form" do
	  erb :loginform
  end

  post "/new_bubble" do
  end

  post "/new_post" do
  end

end

