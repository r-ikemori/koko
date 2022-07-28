class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|

      t.integer :post_content_id, null: false

      t.timestamps
    end
  end
end
