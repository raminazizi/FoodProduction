class Item < ActiveRecord::Base
  has_many :recipeitems, dependent: :destroy
  has_many :recipes , through: :recipeitems
end
