class Topic < ActiveRecord::Base
  has_many :posts
  extend Paginater
end
