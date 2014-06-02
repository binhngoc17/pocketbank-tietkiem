require 'spec_helper'

feature 'Admin sign in' do
  background do
    @admin = FactoryGirl.create(:user, :password => "12345678", :role => "admin")
  end

  scenario 'with valid username & password' do
    sign_in(@admin.email, "12345678")

    visit admin_dashboard_path
    expect(page).to have_content("Signed in successfully")
    expect(page.current_path).to eql admin_dashboard_path
  end

  scenario 'with invalid username & password' do
    sign_in("invalid@email.com", "12345678")

    expect(page).to have_content("Invalid email or password.")
  end
end
