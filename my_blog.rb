#this is called application file/class
require 'sinatra'
require './lib/post' #need to require files being referenced/require always for ruby file

class MyBlog < Sinatra::Base

  get "/" do
    @posts = Post.most_recent(5)
    erb :index
  end

  get "/aboutme" do
    erb :aboutme
  end

  get "/posts/:date/:post" do
    erb :"/posts/#{params[:date]}/#{params[:post]}", :layout => :blog_layout
  end
end
