class Comment < ActiveRecord::Base
  	attr_accessible :commenter, :body, :post_id, :user_id
  	belongs_to :post
 	belongs_to :user
	
end
