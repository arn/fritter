class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :messages, :through => :categorizations
end
