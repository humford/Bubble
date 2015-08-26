class CreatePosts < ActiveRecord::Migration
  def change
	  create_table :posts do |t|
		  t.integer :user_id
		  t.string :post_text
		  t.string :post_media
		  t.datetime :post_date
		  t.integer :post_score
		  t.string :post_topics
		  t.string :post_type

		  t.timestamps null: false
  end
end
