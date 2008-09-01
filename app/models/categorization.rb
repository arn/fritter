class Categorization < ActiveRecord::Base
  belongs_to :categories
  belongs_to :messages
end
