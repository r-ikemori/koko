class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :customer, null: false, foreign_key: true
      t.references :post_content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
