class CreatePostContents < ActiveRecord::Migration[6.1]
  def change
    create_table :post_contents do |t|

      t.integer :customer_id, null: false
      t.integer :ranking_id, null: false
      t.integer :map_id, null: false
      t.integer :post_comment_id, null: false
      t.integer :favorite_id, null: false
      t.string  :name, null: false
      t.string  :prefectures, null: false
      t.text    :description, null: false

      t.timestamps
    end
  end
end
