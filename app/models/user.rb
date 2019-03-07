class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweet

  has_many :followers, :class_name => "Relationship", :foreign_key => "user_id"
  has_many :following, :class_name => "Relationship", :foreign_key => "follower_id"
end
