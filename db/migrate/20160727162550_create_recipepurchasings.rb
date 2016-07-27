class CreateRecipepurchasings < ActiveRecord::Migration
  def change
    create_table :recipepurchasings do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :purchasing, index: true, foreign_key: true
      t.integer :production

      t.timestamps null: false
    end
  end
end
