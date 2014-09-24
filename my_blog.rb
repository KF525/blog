require 'sinatra'

class MyBlog < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/aboutme" do
    erb :aboutme
  end

  get "/posts/:post_name" do
    params.inspect
  end
end
