require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  should_belong_to :user
  should_have_many :categorizations
  should_have_many :categories
  
  def test_setting_categories
    @message = Message.new
    @message.user = users(:quentin)
    @message.content = '-s ample message'
    @message.save
    
    assert_equal [categories(:sample)], @message.categories
  end
  
end
