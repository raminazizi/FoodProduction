class Recipepurchasing < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :purchasing
end
