require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  context 'GET to #new' do
    setup do
      get :new
    end

    should respond_with(:success)
    should render_template(:new)
    should assign_to(:organization)
    should_not set_the_flash
  end

  context 'POST to #create' do
    setup do
      @organization = Organization.make
    end

    context 'when valid' do
      setup do
        Organization.any_instance.expects(:save).returns(true)
        post :create, :organization => @organization
      end

      should respond_with(:redirect)
      should redirect_to('/')
      should set_the_flash.to(/submitted/i)
    end

    context 'when invalid' do
      setup do
        @organization.name = nil
        post :create, :organization => @organization
      end

      should respond_with(:success)
      should render_template(:new)
      should assign_to(:organization)
      should set_the_flash.to(/error/i)
    end
  end

end
