#this is called application file/class
require 'sinatra'
require './lib/post' #need to require files being referenced/require always for ruby file

class MyBlog < Sinatra::Base

  get "/" do
    @posts = Post.most_recent
    erb :index
  end

  get "/aboutme" do
    erb :aboutme
  end

  get "/posts/:date/:post" do
    post = params[:post]
    date = params[:date]
    erb :"/posts/#{date}/#{post}"
  end
end
