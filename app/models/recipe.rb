class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipeitems, dependent: :destroy
  has_many :items , through: :recipeitems

  has_many :recipepurchasings, dependent: :destroy
  has_many :purchasings , through: :recipepurchasings 

end
