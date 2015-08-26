class CreateBubblePosts < ActiveRecord::Migration
  def change
	  create_table :bubble_posts do |t|
		  t.integer :user_id
		  t.integer :post_id
		  t.integer :bubble_id

		  t.timestamps null: false
	  end
  end
end
