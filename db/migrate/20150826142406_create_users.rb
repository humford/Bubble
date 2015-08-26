class CreateUsers < ActiveRecord::Migration
  def change
	  create_table :users do |t|
		  t.string :username
		  t.string :password
		  t.string :realname
		  t.string :email
		  t.datetime :account_created
		  t.string :phone
		  t.integer :score
  end
end
