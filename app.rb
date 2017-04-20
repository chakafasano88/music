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

get "/posts" do
erb :posts
end

get "/user" do
  @users = User.all
end

get "/sign-in" do
  erb :sign_in_form
end

get "/sign-out" do
  session[:user_id] = nil
  redirect "/"
end

get "/login-failed" do
  erb :login_failed
end

def current_user
  if session [:user_id]
    @current_user = User.find(session[:user_id])
  end
end

post '/sign-in' do
  @user = User.where(user_name: params[:user_name]).first
  if @user && @user.password == params[:password]
    redirect '/'
  else
    redirect '/login-failed'
   end
 end

# post '/sign-in' do
#   puts params[:user_name]
#   puts params[:password]
# end


get "/user_create" do
    User.create(user_name:"LeiMafia", password:"goaway92",  fname:"Leila", lname:"Mafoud")
end

get "/posts" do
  @post = Post.all
end

get "/post_create" do
  Post.create(title: "Bowery Electric", date: "1/21/2017", user_id: "12345")
end
