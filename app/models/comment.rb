class Comment < ActiveRecord::Base
  belongs_to :post
  
  def user
    puts "-- models.comment.user --"
  end
  
end
