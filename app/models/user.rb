class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweet
  has_many :relationships

  has_many :follower_relationships, foreign_key: :relationship_id, class_name:"Relationship"
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationship, foreign_key: :user_id, class_name:"Relationship"
  has_many :following, through: :following_relationship, source: :following
  
end
