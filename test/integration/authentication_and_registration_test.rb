require 'integration_test_helper'

class AuthenticationAndRegistrationTest < ActionDispatch::IntegrationTest
  # As a potential user
  # I should be able to register for access
  # So that I can participate in the gifting process.
  
  should 'Allow a user to register for access' do
    @user = User.make(:password => 'tester', :password_confirmation => 'tester')

    visit root_path
    within('#registration') do
      click_link 'Sign Up'
    end

    assert_equal current_path, new_user_registration_path
    assert page.has_content?('Sign Up')

    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => 'tester'
    fill_in 'Confirm', :with => 'tester'
    click_link_or_button 'Sign Up'

    save_and_open_page
    assert_equal current_path, root_path
    assert page.has_content?('You have signed up successfully.')
  end
  
  # As a registered user
  # I should be able to sign in
  # So that I can use the site

  should 'allow a registered user to sign in' do
    @user = User.make!(:password => 'tester', :password_confirmation => 'tester')

    visit root_path
    click_link 'Sign In'

    assert_equal current_path, new_user_session_path
    assert page.has_content?('Sign In')

    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => 'tester'
    click_button 'Sign In'

    assert_equal current_path, root_path
    assert page.has_content?('')
  end
end
