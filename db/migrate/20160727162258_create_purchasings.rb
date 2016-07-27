class CreatePurchasings < ActiveRecord::Migration
  def change
    create_table :purchasings do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
