require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  should_have_many :categorizations
  should_have_many :messages
  
end
