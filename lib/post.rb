require 'date'

class Post
  attr_accessor :title, :url, :date, :id, :excerpt

  def initialize(file_array)
    @title = file_array[-1].split(".").first
    @date = file_array[2]
    @url = "/posts/#{@date}/#{@title}"
    @excerpt = nil
  end

  def self.all
    Dir.glob("views/posts/**/*.erb").collect do |filepath|
      a = filepath.split("/")
      new(a)
    end
  end

  def self.update_attributes
    all.each do |post|
      file_content = open("views#{post.url}.erb").read
      line = /"post_excerpt"/ =~ file_content

      post.date = Date.parse(post.date)
      post.title = post.title.gsub!("_", " ")
      post.excerpt = file_content[(line.to_i + 15), 125]
    end
  end

  def self.sort_date
    update_attributes.sort_by { |x| x.date }
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
end
