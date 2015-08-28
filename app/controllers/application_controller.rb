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
	  set :session_secret, "Bubble"
  end

  helpers do
	  def home_posts(user_id, limit=0)
		  if limit < 1
		  	  posts = Post.joins(:bubbles).where("bubbles.user.id" == user_id)
		  else
			  posts = Post.joins(:bubbles).where("bubbles.user.id" == user_id).limit(limit)
		  end
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

	  def login?
    	if session[:username].nil?
        return false
      else
        return true
       end
     end

     def username
       return session[:username]
     end
  end

  get "/" do
	  @user = find_user(session[:user_id])
	  @posts = home_posts(session[:user_id])
	  erb :index
  end

  get "/mybubbles" do
	 @user = find_user(session[:user_id])
	 @posts = home_posts(session[:user_id], 10)
	 erb :mybubbles
  end

  get "/explore" do
	  @user = find_user(session[:user_id])
	  erb :explore
  end
  
  get "/signup" do
    erb :signup
  end

  get "/navbar" do
	  erb :navbar
  end

  get "/bubble/new" do
	   @user = find_user(session[:user_id])
	   @posts = home_posts(session[:user_id])
      erb :newbubble
  end

  get "/post/new" do
	  @user = find_user(session[:user_id])
	  @posts = home_posts(session[:user_id])
	  erb :newpost
  end


  post "/user/create" do
	 @user = User.new({:username => params[:username], :email => params[:email], :realname => params[:realname], :phone => params[:phone]})
	 @user.password = params[:password]
    @user.save
#	 @bubble = Bubble.find_by({:bubble_name => "Flatiron School"})
#	 @bubble.users << @user
#	 @bubble.save
	 session[:user_id] = @user.id
    redirect "/"
  end

  post "/bubble/create" do
      @user = find_user(session[:user_id])
	   @bubble = Bubble.new ({:bubble_name => params[:bubble_name], :bubble_topics => params[:bubble_topics], :bubble_creator_id => session[:user_id], :bubble_votes => 0})
	   @bubble.users << @user
	   @bubble.save
      redirect "/bubble/show/#{@bubble.id}"
  end

  post "/post/create/quick" do
      @post = Post.new ({:user_id => session[:user_id], :post_text => params[:post_text]})
      @post.save
	  ## :bubble.each do |name|
	   @bubble = Bubble.find_by({:bubble_name => params[:bubble]})
	   @bubble.posts << @post
	   @bubble.save
	   redirect "/bubble/show/#{@bubble.id}"
  end

  post "/post/create" do
     puts params
	  @post = Post.new ({:user_id => session[:user_id], :post_text => params[:post_text], :post_media => params[:post_media], :post_score => 0, :post_topics => params[:post_topics], :post_type => params[:post_type]})
      @post.save
	   params[:bubble].each do |bubble|
			@bubble = Bubble.find_by({:bubble_name => bubble})
	   	@bubble.posts << @post
	   	@bubble.save
		end
      redirect "/"
  end

  get "/profile/show/:id" do
	 @user = find_user(session[:user_id])
    @user_posts = Post.where({:user_id => params[:id]})
    erb :profile
  end

   get "/bubble/show/:id" do
	  @user = find_user(session[:user_id])
	  @bubble = Bubble.find_by({:id => params[:id]})
	  @bubble_posts = Post.joins(:bubbles).where(:bubble_id == @bubble.id)
	  erb :bubble
  end

  get "/post/show/:id" do
	 @user = find_user(session[:user_id])
	 @post = Post.find_by({:id => params[:id]})
    erb :post
  end

	get "/bubble/join" do
		@bubble = Bubble.find_by({:bubble_name => params[:bubble]})
		@user = find_user(session[:user_id])
		@bubble.users << @user
		@bubble.save
		redirect "/bubble/show/#{@bubble.id}"
	end

  post "/login" do
	 @user = User.find_by(:username => params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
		redirect "/profile/show/#{session[:user_id]}"
    end
	 erb :error
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end

#All posts which are in one or more of the bubbles in all bubbles that have a member with 'userid'
