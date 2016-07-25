class AddStuffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :companyname, :string
    add_column :users, :companywebsite, :string
    add_column :users, :img_url, :string
  end
end
