class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Downcase the username before saving it to the database
  before_save { |user| user.username = user.username.downcase }  

  # Limit a Users Bio to 220 characters

  validates :name, :presence => {message: 'cannot be blank!' }  
  validates :username, :presence => {message: 'cannot be blank!' }  

  validates_uniqueness_of :username
end
