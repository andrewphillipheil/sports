class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Attributes Accepted for Users
  attr_accessible  :name, :username, :email, :password, :password_confirmation, :location, :admin

  # Downcase the username before saving it to the database
  before_save { |user| user.username = user.username.downcase }  

  # Limit a Users Bio to 220 characters
  validates :about, length: { maximum: 200 } 

  validates :name, :presence => {message: 'cannot be blank!' }  
  validates :username, :presence => {message: 'cannot be blank!' }  

  validates_uniqueness_of :username
end
