module Features
  module Helpers
    def sign_in(email, password, js = false)
      visit new_user_session_path
      fill_in 'user_email', :with => email
      fill_in 'user_password', :with => password
      click_button('Sign in')
    end

    def logged_as_admin
      @admin = FactoryGirl.create(:user, :password => "12345678", :role => "admin")
      sign_in(@admin.email, "12345678")
    end
  end
end
