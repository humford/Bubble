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

  helpers do
	  def home_posts(user_id)
		  posts = Post.joins(:bubbles).where("bubbles.user.id" == user_id)
		  return posts
     end
	  def find_user(user_id)
		  if user_id != nil
			  user = User.find_by({:id => user_id})
			  return user
		  else
			  return nil
		  end
	  end
  end

  get "/" do
	  @user = find_user(session[:user_id])
	  @posts = home_posts(session[:user_id])
	  erb :index
  end

  get "/mybubbles" do
  end
  
  get "/signup" do
    erb :signup
  end

  get "/navbar" do
	  erb :navbar
  end

  post "/bubble/create" do
      @bubble = Bubble.new ({:bubble_name => params[:bubble_name], :bubble_topics => params[:bubble_topics], :bubble_creator_id => session[:user_id], :bubble_votes => 0})
      @bubble.save
      redirect "/bubble/show/#{@bubble.id}"
  end

  post "/post/create" do
      @post = Post.new ({:user_id => session[:user_id], :post_text => params[:post_text], :post_media => params[:post_media], :post_score => 0, :post_topics => params[:post_topics], :post_type => params[:post_type]})
      @post.save
      redirect "/"
  end

  get "/bubble/new" do
      erb :newbubble
  end

  get "/post/new" do
	erb :newpost
  end


  post "/user/create" do
    @user = User.new({:username => params[:username], :email => params[:email], :realname => params[:realname], :phone => params[:phone], :password => params[:password]})
    @user.save
    redirect "/"
  end

  get "/profile/show/:id" do
	 @user = find_user(session[:user_id])
    @user_posts = Post.where({:user_id => params[:id]})
    erb :profile
  end

   get "/bubble/show/:id" do
	  @bubble = Bubble.find_by({:id => params[:id]})
	  @bubble_posts = Post.joins(:bubbles).where(:bubble_id == @bubble.id)
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
    redirect "/profile/show/#{@user.id}"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end

#All posts which are in one or more of the bubbles in all bubbles that have a member with 'userid'
