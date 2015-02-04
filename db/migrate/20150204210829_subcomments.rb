class Subcomments < ActiveRecord::Migration
  def change
  	create_table :subcomments do |t|
      t.integer :comment_id
      t.integer :user_id
      t.text		:text   
      t.timestamps 
    end
  end
end
