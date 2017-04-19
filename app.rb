require "sinatra"
require "sinatra/activerecord"
require "./models"
#this is needed for sinatra flash
require "bundler/setup"
require "sinatra/flash"
require "sinatra/flash"

set :database, "sqlite3:HQ.sqlite3"



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
  @users = Users.all
end

get "/user_create" do
    Users.create(user_name:"LeiMafia", password:"goaway92",  fname:"Leila", lname:"Mafoud")
end

get "/posts" do
  @posts = Posts.all
end

get "/post_create" do
  Posts.create(title: "Bowery Electric", date: "1/21/2017", user_id: "12345" )
end
