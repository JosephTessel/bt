require 'rails_helper'

# Acceptance Criteria
# [x] I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
# [x] Only years from 1920 and above can be specified.
# [x] I can optionally specify a description of the car.
# [x] If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
# [x] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# [x] Upon successfully creating a car, I am redirected back to the index of cars.

feature "As a user I want to be able to visit the site
so that I can submit a new design.
So that I can list it on the site" do
  scenario 'Designer fills in shirt form correctly and submits' do
    visit new_design_path

    fill_in 'Title', with: "Toaster Boy"
    fill_in 'Description', with: "It's an average boy... IN TOASTER FORM!"
    click_button "Submit Design"

    expect(page).to have_content("Toaster Boy")
    expect(page).to have_content("It's an average boy... IN TOASTER FORM!")
    expect(page).to have_content("Design Submitted!")

  end

end
