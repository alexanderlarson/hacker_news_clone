class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.text    :url
      t.integer :author_id
      t.integer :comment_id
      t.timestamps
    end 
  end
end
