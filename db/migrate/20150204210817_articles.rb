class Articles < ActiveRecord::Migration
  def change
  	create_table :articles do |t|
      t.text :title
      t.text :img_url
      t.timestamps 
    end
  end
end
