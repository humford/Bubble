class CreateBubbles < ActiveRecord::Migration
  def up
      create_table :bubbles do |t|
          t.string :bubble_name
          t.string :bubble_topics
          t.integer :bubble_creator_id
          t.integer :bubble_votes

			 t.timestamps null: false
		end
  end
  def down
      drop_table :bubbles
  end
end
