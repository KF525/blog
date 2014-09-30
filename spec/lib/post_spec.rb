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
    Post.find_current_index("/posts/2014-09-27/Class_Methods")
    
  # it "if current blog index is 1, next blog url value is in index 2" do
  #   expect()
  #
  #   expect(Post.sort_date[(find_current_index(2))]).url to eq
  #     "/posts/2014-09-28/Thoughts_on_Strings"
  # end
end
