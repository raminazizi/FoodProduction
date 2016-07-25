class Recipe < ActiveRecord::Base
  has_many :recipeitems
  has_many :items , through: :recipeitems
end
