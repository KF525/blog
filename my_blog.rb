#this is called application file/class
require 'sinatra'
#need to require files being referenced/require always for ruby file
require './lib/post'

class MyBlog < Sinatra::Base

  get "/" do
    @current_page = :home
    @posts = Post.most_recent(5)
    erb :index
  end

  get "/aboutme" do
    @current_page = :about
    erb :aboutme
  end

  get "/favoritethings" do
    @current_page = :about
    erb :favoritethings
  end

  get "/bloglanding" do
    @current_page = :blog
    @all_posts = Post.all.size
    @posts = Post.most_recent(@all_posts)
    erb :bloglanding
  end

  get "/search" do
    erb :search
  end

  post "/search" do
    @search_term = params[:search]
    @results = Post.search(@search_term)
    erb :search
  end

  get "/posts/:date/:post" do
    @current_index = Post.find_current_index("/posts/#{params[:date]}/#{params[:post]}")
    @current_page = :blog
    erb :blog_layout, :layout => :layout do
      erb :"/posts/#{params[:date]}/#{params[:post]}"
    end
  end
end
