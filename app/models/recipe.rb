class Recipe < ActiveRecord::Base
  has_many :recipeitems, dependent: :destroy
  has_many :items , through: :recipeitems
end
