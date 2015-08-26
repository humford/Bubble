class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :bubbles through :memberships
end
