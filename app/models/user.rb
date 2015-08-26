class User < ActiveRecord::Base
	has_many :memberships
	has_many :posts
	has_many :bubbles, through: :memberships
end
