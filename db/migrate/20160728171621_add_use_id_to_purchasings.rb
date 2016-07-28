class AddUseIdToPurchasings < ActiveRecord::Migration
  def change
    add_column :purchasings, :user_id, :integer
  end
end
