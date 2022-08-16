class CreatePostContents < ActiveRecord::Migration[6.1]
  def change
    create_table :post_contents do |t|

      t.integer :customer_id, null: false

      t.string  :name, null: false
      t.string  :prefectures, null: false
      t.text    :description, null: false
      t.string  :address, null: false
      t.float   :latitude, null: false
      t.float   :longitude, null: false

      t.timestamps
    end
  end
end
