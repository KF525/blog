require 'sinatra'

class MyBlog < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/aboutme" do
    erb :aboutme
  end

  get "/posts/:post" do
    post = params[:post]
    erb :"/posts/#{post}"
  end
end
