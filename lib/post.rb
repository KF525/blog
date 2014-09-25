require 'Date'

class Post
  attr_accessor :title, :url, :date

  def initialize(file_array)
    @title = file_array[-1].split(".")[0]
    @date = file_array[2]
    @url = "/posts/#{@date}/#{@title}"
  end

  def self.all
    Dir.glob("views/posts/**/*.erb").collect do |filepath|
      a = filepath.split("/")
      new(a)
    end
  end

  def self.parse_date
    all.each do |post|
      post.date = Date.parse(post.date)
    end
  end

  def self.sort_date
    parse_date.sort_by { |x| x.date }
  end

  def self.most_recent
    recent_posts = []
    all_posts = []

    all_posts<<sort_date


    all_posts.flatten.reverse_each do |blog|
      if recent_posts.count == 5 then
        break
      end
      recent_posts<<blog
    end
    recent_posts
  end
end
