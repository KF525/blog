class Post
  #access posts, files within views/posts
  #post has title, url, filename, content

  #read my list of post files
  #create an array of post objects with attributes set
  #post.all
  def initialize(file_array)
    # @filename = file_array[]
    # @url = file_array[]
    # @title = file_array[]
  end

  def self.all
    Dir.glob("views/posts/*.erb").collect do |filepath|
      a = filepath.split("/")[2]
      new(a)
    end
  end

end



#
# def self.post_array
#   Dir.entries("views/posts/")
# end
#
# def self.slice
#   post_array.collect do |post|
#     post.slice!(-1..-4)
#     puts post
#   end
# end
#
# def self.post_links
#   post_array.collect do |post|
#     @@blog_posts[post]= "/views/posts/" + post
#   end
#   puts @@blog_posts
# end
#Create a ruby class in /lib to read your /views/posts files
#Dynamically display a link to each file within /views/posts on your homepage ("/")
#Dir["./views/posts/**.erb"]

#Dir.glob(*) -> search all
