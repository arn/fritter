require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  context "GET on :index" do
    setup do
      get :index
    end
    
    should_render_template :index
    should_respond_with :success
  end
  
  context "GET on :about" do
    setup do
      get :about
    end
    
    should_render_template :about
    should_respond_with :success
  end

end
