class Purchasing < ActiveRecord::Base
  belongs_to :user
  has_many :recipepurchasings, dependent: :destroy
  has_many :recipes , through: :recipepurchasings
end
