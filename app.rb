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

get "/user" do
  @users = User.all
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

get "/sign-up" do
  erb :sign_up
end

get "/login-failed" do
  erb :login_failed
end
# This is the profile
get "/profile" do
  @user = User.find(session[:user_id])
  erb :profile
end

def current_user
  if session[:user_id]
    User.find(session[:user_id])
  end
end

# get "/user_create" do
#     User.create(user_name:"LeiMafia", password:"goaway92",  fname:"Leila", lname:"Mafoud")
# end
# # Instance variable "post"
# get "/posts" do
#   @posts = Post.all
#   @latest_posts = Post.all.last(2)
#   erb :posts
# end
#
# get "/post_create" do
#   Post.create(title: "Bowery Electric", date: "1/21/2017", user_id: "12345")
# end

post '/new_account' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect '/'
end

post '/posts' do
  @post =  Post.create(params[:post])
  session[:user_id] = @post.id
  redirect '/'
end

get '/new_account' do
  erb :new_account
end

get '/user-posts' do
  erb :user_posts
end
