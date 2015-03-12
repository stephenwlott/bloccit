class Topic < ActiveRecord::Base
  has_many :posts
  
    
    
  #def paginate(page, per_page)
  #  
  #end
  
  def @temp
    puts "----- Topic.temp method -----"
  end

  
end
