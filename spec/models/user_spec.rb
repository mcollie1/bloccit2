require 'spec_helper'

describe User do 
  
  describe ".top_rated" do
    before :each do
      post = nil
      topic = create(:topic)
      @u0 = create(:user) do |user|
        post = user.posts.build(attributes_for(:post))
        post.topic = topic
        post.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
  
      end

      @u1 = create(:user) do |user|
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
        post = user.posts.build(attributes_for(:post))
        post.topic = topic
        post.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
      end
    end

    it "should return users based on comments + posts" do
      User.top_rated.should eq([@u1, @u0])
    end
    it "should have `posts_count` on user" do
      users = User.top_rated
      users.first.posts_count.should eq(1)
    end
    it "should have `comments_count` on user" do
      users = User.top_rated
      users.first.comments_count.should eq(2)
    end
    it "should return `rank` based on comments + posts" do
      users = User.top_rated
      users.first.rank.should eq(3)
    end
    it "should associate `user` with posts" do
      p1 = Post.first
      p2 = Post.last
      expect(p2.user).to eq(@u0)
      expect(p1.user).to eq(@u1)
    end
  end

  describe ".role?" do
    before :each do
      @u0 = create(:user)
    end

    it "should return `role` of the user in the form of a string" do
      @u0.role {should be_kind_of(String)}
    end
  end
end