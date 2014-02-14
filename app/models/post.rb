class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user

	attr_accessible :title,:text,:user_id

	validates :title, presence: true, length: { minimum: 3 }
	validates :text, presence: true, length: { minimum: 5 }
    validates :user_id, presence: true
end
