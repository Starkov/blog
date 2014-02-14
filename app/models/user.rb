class User < ActiveRecord::Base
	attr_accessible :name, :surname, :birthday, :email, :password, :role
	ROLES = %w[author admin]
	has_many :comments	
	has_many :posts	


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name,:surname, length: { minimum: 2, maximum: 40 }       
  validates :birthday, presence: true
end
