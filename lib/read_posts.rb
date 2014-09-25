class ReadPosts
#Create a ruby class in /lib to read your /views/posts files
#Dynamically display a link to each file within /views/posts on your homepage ("/")
#Dir["./views/posts/**.erb"]

  @@blog_posts = {}

  def self.post_array
    Dir.entries("views/posts/")
  end

  def self.slice
    post_array.collect do |post|
      post.slice!(-1..-4)
      puts post
    end
  end

  def self.post_links
    post_array.collect do |post|
      @@blog_posts[post]= "/views/posts/" + post
    end
    puts @@blog_posts
  end
end
