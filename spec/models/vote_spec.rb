require 'rails_helper'

describe Vote do
  describe "validations" do
    before do
      post = Post.create(title: 'post title', body: 'Post bodies must be pretty long.')
      @vote = Vote.create(value: 1, user_id: 1, post_id: 1)
    end
    
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@vote.value).to eq(-1).or eq(1)
      end
    end
  end
end