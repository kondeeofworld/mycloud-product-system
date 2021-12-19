class CreateCategories < ActiveRecord::Migration[6.1]
  drop_table :categories
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_cate_id

      t.timestamps
    end
  end
end
