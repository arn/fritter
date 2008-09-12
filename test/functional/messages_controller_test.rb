require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  
  def setup
    login_as('quentin')
  end

  context "GET on :index" do
    setup do
      get :index
    end
    
    should_render_a_form
    should_respond_with :success
    should_assign_to :messages
  end

  should ":new with GET and no :id" do
    get :new
    assert_response :success
  end

  should "POST creates message" do
    assert_difference 'Message.count' do
      post :create, :message => { :content => 'something' }
    end

    assert_redirected_to messages_path
  end

  should ":show with GET and an :id" do
    get :show, :id => messages(:sample_msg).id
    assert_response :success
  end

  should ":edit with GET and an :id" do
    get :edit, :id => messages(:sample_msg).id
    assert_template "edit"
    assert_response :success
  end

  should "PUT updates a message" do
    put :update, :id => messages(:sample_msg).id, :message => { :content => "test" }
    assert_redirected_to message_path(assigns(:message))
  end

  should "DELETE destroy a message" do
    assert_difference('Message.count', -1) do
      delete :destroy, :id => messages(:sample_msg).id
    end

    assert_redirected_to messages_path
  end
end
