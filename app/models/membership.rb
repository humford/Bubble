class Membership < ActiveRecord::Base
	belongs_to :bubble
	belongs_to :user
end
