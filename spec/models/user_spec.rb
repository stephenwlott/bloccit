require 'rails_helper'
describe User do 
  include TestFactories
 
  describe "#favorited(post)" do
    before do
      @post = associated_post
      @user = authenticated_user
    end
    
    it "returns `nil` if the user has not favorited the post" do
      expect(@user.favorited(@post)).to eq(nil)
    end
 
    it "returns the appropriate favorite if it exists" do
      @favorite = Favorite.create(post_id: @post.id, user_id: @user.id)
      expect(fav = @user.favorited(@post)).to eq(@favorite)
    end
  
    it "returns nil if user has favorited a different post than the post passed into favorited" do
      # post2 favorited:
      @post2 = associated_post
      Favorite.create(post_id: @post2.id, user_id: @user.id)
      # post passed to favorited:
      expect(@user.favorited(@post)).to eq(nil)
    end
  end
end