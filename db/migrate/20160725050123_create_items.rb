class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :yield
      t.float :price
      t.integer :calorie

      t.timestamps null: false
    end
  end
end
