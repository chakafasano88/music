require "sinatra"
require "sinatra/activerecord"
require "./models"
#this is needed for sinatra flash
require "bundler/setup"
require "sinatra/flash"


set :database, "sqlite3:HQ.sqlite3"
set :sessions, true

get "/" do
"Hello World"
erb :home
end

get "/music" do
erb :music
end

get "/videos" do
erb :videos
end

get "/photos" do
erb :photos
end
# Includes instance method for all Users
get "/user" do
  @users = User.all
# erb :users
end

get '/new_account' do
  erb :new_account
end

post '/new_account' do
  @user = User.create(
    fname: params[:fname],
    lname: params[:lname],
    user_name: params[:user_name],
    password: params[:password]
  )

  @profile = Profile.create(
    user_id: @user.id,
    city: params[:city]
  )

  session[:user_id] = @user.id
  redirect '/'
end

# This is the profile
get "/profile/:id" do
  @user_profile = Profile.find(params[:id])
  # Profile.find_by(id: params[:id])

  # Profile.find_by({
  #   id: params[:id]
  # })
  #
  # @hash = { id: params[:id] }
  #
  # Pofile.find_by(@hash)
  #





  erb :user_profile
end

get '/user-profile' do
  @user_profile = Profile.find_by(user_id:session[:user_id])
  erb :user_profile
end

get '/user-posts' do
  erb :user_posts
end

# Instance variable "post", shows recent posts
get "/posts" do
  @posts = Post.all
  @latest_posts = Post.all.last(10)
  erb :posts
end

post '/posts' do
  @post =  Post.create(params[:post])
  session[:user_id] = @post.id
  redirect '/'
end

get "/sign-up" do
  erb :sign_up
end

get "/sign-in" do
  erb :sign_in_form
end

# Allows user to sign in
post '/sign-in' do
  @user = User.where(user_name: params[:user_name]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:notice] = "You've been signed in successfully"
    redirect '/'
  else
    flash[:notice] = "There was an issue signing you in"
   end
   redirect "/"
 end

get "/sign-out" do
  session[:user_id] = nil
  redirect "/"
end

# Tracks users activity while logged in
def current_user
  if session[:user_id]
    User.find(session[:user_id])
  end
end

# user = User.find_by(user_id: 'David')
# user.destroy

# get "/user_create" do
#     User.create(user_name:"LeiMafia", password:"goaway92",  fname:"Leila", lname:"Mafoud")
# end

# get "/post_create" do
#   Post.create(title: "Bowery Electric", date: "1/21/2017", user_id: "12345")
# end

# post '/profile' do
#   @profiles =  Profile.create(params[:profile])
#   session[:user_id] = @profiles.id
#   redirect '/'
# end
