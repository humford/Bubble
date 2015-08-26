class BubblePost < ActiveRecord::Base
	belongs_to :bubble
	belongs_to :post
end
