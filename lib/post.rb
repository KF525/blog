require 'date'

class Post
  attr_accessor :title, :url, :date, :id

  def initialize(file_array)
    @title = file_array[-1].split(".")[0].gsub!("_", " ")
    @date = file_array[2]
    @url = "/posts/#{@date}/#{@title}"
    @id = nil
  end

  def self.all
    @all ||= all_create
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

  def self.most_recent(n)
    recent_posts = []
    all_posts = []

    all_posts<<sort_date

    all_posts.flatten.reverse_each do |post|
      if recent_posts.count == n then
        break
      end
      recent_posts<<post
    end
    recent_posts
  end

  def post_excerpt
    
  end
  #
  # def self.unique_ids
  #   n = 0
  #    all.collect do |post|
  #     post.id = n + 1
  #     n = post.id
  #    end
  # end
end
