class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user_id, presence: true
end