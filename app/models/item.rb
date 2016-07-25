class Item < ActiveRecord::Base
  has_many :recipeitems
  has_many :recipes , through: :recipeitems
end
