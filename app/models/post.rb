class Post < ActiveRecord::Base
	belongs_to :user
	has_many :bubble_posts
	has_many :comments
	has_many :bubbles, through: :bubble_posts
end
