require 'integration_test_helper'

class RecipientOrganizationsTest < ActionDispatch::IntegrationTest
  # As a user at a recipient organization
  # I want to be able to create an account
  # So that I can upload a spreadsheet of wishes

  should 'Allow a user to sign up an organization' do
    visit root_path
    within('#recipients') do
      click_link 'Sign Up'
    end
    assert_equal current_path, new_organization_path(:org_type => 'recipient')
    assert page.has_content?('Add Organization')

    fill_in 'Name', :with => 'Test'
    click_button 'Create Organization'
    assert page.has_content?('submitted for approval')
  end
end
