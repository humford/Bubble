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

  get "/navbar" do
	  erb :navbar
  end

  get "/bubble/new" do
      erb :newbubble
  end

  post "/bubble/create" do
      @bubble = Bubble.new ({:bubble_name => params[:bubble_name], :bubble_topics => params[:bubble_topics], :creator_id => session[:user_id], :bubble_votes => 0})
      @bubble.save
      redirect "/bubble/show/#{@bubble.id}"
  end

  get "/bubble/show/:id" do
	  @bubble = Bubble.find_by({:id => params[:id]})
	  erb :bubble
  end

  get "/post/new" do
	erb :newpost
  end

  post "/post/create" do
  end

  get "/profile/show/:id" do
    @user = User.find_by({:id => params[:id]})
#    @user_tweets = Tweet.where({:user_id => params[:id]})
    erb :profile
  end

  get "/signup" do
    erb :signup
  end

  post "/user/create" do
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
      redirect "/"
    end
    redirect "/profile/show/#{@user.id}"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  get "/login_form" do
	  erb :loginform
  end

end

