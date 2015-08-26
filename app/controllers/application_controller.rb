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
	  redirect "/"
  end

end

