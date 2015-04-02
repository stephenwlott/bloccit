require 'rails_helper'
include TestFactories

describe Vote do
  describe "validations" do
    
    before do
      @post = associated_post
      @vote = Vote.create(value: 1, user_id: 1, post_id: 1)
    end
   
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@vote.value).to eq(-1).or eq(1)
      end
    end
    
  end
  
  describe 'after_save' do
    it "calls `Post#update_rank` after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
  
end