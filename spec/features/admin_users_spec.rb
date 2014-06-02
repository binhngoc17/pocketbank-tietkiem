require 'spec_helper'

feature 'Admin see users\' information' do
  def prepare_users
    @users = []
    @users << FactoryGirl.create(:user)
  end

  background do
    logged_as_admin
    prepare_users
  end

  scenario "see the users' email", :js => true do
    visit admin_users_path

    @users.each do |u|
      expect(page).to have_content(u.email)
    end
  end
end


