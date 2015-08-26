class Bubble < ActiveRecord::Base
	has_many :bubble_posts
	has_many :memberships
	has_many :posts, through: :bubble_posts
	has_many :users, through: :memberships
end
