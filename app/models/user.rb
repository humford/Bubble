class User < ActiveRecord::Base
	has_many :memberships
	has_many :posts
	has_many :bubbles, through: :memberships

  validates :username,
    presence: true,
    format: { with: /\A([a-z]|[1-9])+\Z/i,
    message: "user letters and numbers only" }

  validates :email,
    presence: true,
    format: { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i,
    message: "not a valid email" }
end
