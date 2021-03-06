class CreateRecipeitems < ActiveRecord::Migration
  def change
    create_table :recipeitems do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :amount
      t.string :unit

      t.timestamps null: false
    end
  end
end
