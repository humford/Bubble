class User < ActiveRecord::Base
	has_many :posts
	has_many :bubbles through :memberships
end
