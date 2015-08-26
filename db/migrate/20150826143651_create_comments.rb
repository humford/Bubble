class CreateComments < ActiveRecord::Migration
  def up
      create_table :comments do |t|
          t.integer :post_id
          t.integer :user_id
          t.string :comment_text
          t.string :comment_media
          t.integer :comment_score
          t.datetime :comment_created

			 t.timestamps null: false
    	end
  end
  def down
      drop_table :comments
  end
end
