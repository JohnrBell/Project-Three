class PArticles < ActiveRecord::Migration
  def change
  	create_table :p_articles do |t|
      t.text :title
      t.text :img_url
      t.timestamps 
    end
  end
end
