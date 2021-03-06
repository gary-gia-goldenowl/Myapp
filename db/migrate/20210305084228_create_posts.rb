class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user 
      t.references :category

      t.string :title, null: false
      t.text :content
      t.string :images

      t.timestamps
    end
  end
end
