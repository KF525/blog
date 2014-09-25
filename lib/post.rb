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

  def parse_date #do a loop and update the dates??
    Date.parse(@date)
  end

  def sort_date
    #sort_by date
  end

  def most_recent(posts)
    #push the first five results to homepage
  end
end
