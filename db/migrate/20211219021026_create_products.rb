class CreateProducts < ActiveRecord::Migration[6.1]
  drop_table :products
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
