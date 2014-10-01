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

  def update_post
    file_content = open("views#{self.url}.erb").read
    line = /"post_excerpt"/ =~ file_content

    self.date = Date.parse(self.date)
    self.title = self.title.gsub!("_", " ")
    self.excerpt = file_content[(line.to_i + 15), 125]
  end

  def self.update_posts
    all.each do |post|
      post.update_post
    end
  end

  def self.sort_date
    update_posts.sort_by { |x| x.date }
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

  def self.find_current_index(an_url)
    @current_index = sort_date.index { |post| post.url == an_url }
  end

  def self.next_blog
    if @current_index < Post.all.length - 1
      sort_date[ (@current_index + 1) ].url
    end
  end

  def self.last_blog
    if @current_index > 0
      sort_date[ (@current_index - 1) ].url
    end
  end
end
