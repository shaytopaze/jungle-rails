require 'rails_helper'

RSpec.feature "Visitor navigates to login", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      name: 'Shay',
      email: 'shay@shay.shay',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  scenario "They see login page" do
    visit '/login'

    # commented out b/c it's for debugging only
    # save_and_open_screenshot 'login.png'

    within('div.row') { expect(page).to have_content('Login') }
  end


  scenario "Login inputs filled" do
    visit '/login'


    within 'form' do
      fill_in id: 'email', with: 'shay@shay.shay'
      fill_in id: 'password', with: "password"

      click_button 'Submit'
    end

    # commented out b/c it's for debugging only
    # save_and_open_screenshot 'login.png'

    expect(page).to have_content('Logout')
  end
end
