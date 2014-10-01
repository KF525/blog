require 'spec_helper'

describe Post do
  describe "class methods" do
    it "all should return" do
      expect(Post.all.count).to eq 6
    end
  end

  it "should find index of a post" do
    expect(Post.find_current_index("/posts/2014-09-27/Class_Methods")).to eq 1
  end

  it "if current blog index is 1, 'next blog' url is equal to index 2 post url" do
    Post.find_current_index("/posts/2014-09-28/Thoughts_on_Strings")

    expect(Post.next_blog).to eq "/posts/2014-09-29/Thinking_Through_Algorithms"
  end
  it "if current blog index is 1, next blog url value is index 2" do
    Post.find_current_index("/posts/2014-09-28/Thoughts_on_Strings")

    expect(Post.last_blog).to eq "/posts/2014-09-27/Class_Methods"
  end
  it "if current blog index is 1, last blog url value is index 0" do
    Post.find_current_index("/posts/2014-09-27/Class_Methods")

    expect(Post.last_blog).to eq "/posts/2014-09-25/An_Instance_of_a_Class"
  end
  it "if current blog index is 4, next blog url value is index 5" do
    Post.find_current_index("/posts/2014-09-29/Technology_is_Magic")

    expect(Post.next_blog).to eq "/posts/2014-09-30/HTML_Reinforcing_Meaning"
  end
end
