require 'rails_helper'
require 'pry'
# Acceptance Criteria
# [x] I can sign in, and submit a design to the website.
# [x] I can optionally specify a description of the design.
# [x] If I enter all of the required information in the required formats, the design is recorded and I am presented with a notification of success.
# [x] If I do not specify all of the required information in the required formats, the design is not recorded and I am presented with errors.
# [x] Upon successfully creating a design, I am redirected back to the index of designs.

feature "As a user I want to be able to visit the site
so that I can submit a new design.
So that I can list it on the site" do
  scenario 'Designer fills-in design form correctly and submits' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link 'View all designs'
    click_link 'Submit a Design'

    fill_in 'Design name', with: "Toaster Boy"
    fill_in 'Description', with: "It's an average boy... IN TOASTER FORM!"
    click_button "Submit Design"

    expect(page).to have_content("Toaster Boy")
    expect(page).to have_content("It's an average boy... IN TOASTER FORM!")
    expect(page).to have_content("Design Submitted!")
    expect(page).to have_content(user.id)
    expect(page).to have_content(user.email)
  end

  scenario 'Designer fills-in design form incorrectly and submits' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link 'View all designs'
    click_link 'Submit a Design'

    fill_in 'Description', with: "It's an average boy... IN TOASTER FORM!"
    click_button "Submit Design"

    expect(page).to have_content("Design name can't be blank")
  end

  scenario 'Designer fills-in design form correctly, but is not signed in, and submits' do
    visit new_design_path

    fill_in 'Design name', with: "Toaster Boy"
    fill_in 'Description', with: "It's an average boy... IN TOASTER FORM!"
    click_button "Submit Design"

    expect(page).to have_content("User can't be blank")
  end

  scenario 'Designer fills-in design form incorrectly, and is not signed in, then submits' do
    visit new_design_path

    fill_in 'Description', with: "It's an average boy... IN TOASTER FORM!"
    click_button "Submit Design"

    expect(page).to have_content("User can't be blank")
    expect(page).to have_content("Design name can't be blank")
  end

end
