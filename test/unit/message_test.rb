require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  should_belong_to :user
  should_have_many :categorizations
  should_have_many :categories
  
  should_require_attributes :content
  
  should_have_named_scope :public
  
  context "Saving a message" do
    should "increases Message.count" do
      assert_difference 'Message.count' do
        @message = Message.create( :content => 'some content', :user_id => 1 )
      end
    end
    
    should "sets a category" do
      @message = Message.create( :content => '-s sample message', :user_id => 1 )
      assert_equal 1, @message.categories.count
      assert_equal [categories(:sample)], @message.categories
    end
  end
end
