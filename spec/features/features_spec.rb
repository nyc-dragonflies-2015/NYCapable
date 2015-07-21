require 'rails_helper'

feature 'visit root page' do

  scenario 'user visits root page' do
    visit root_path
    expect(page).to have_selector("input#autocomplete")

  end

  scenario 'user expects input field on root page' do
    visit root_path
    expect(page).to have_selector("input")

  end

  xscenario 'user should see station options when submitting address' do
    visit root_path
    fill_in "",:with => '48 Wall Street, New York, NY 10015'
    expect(page).to redirect_to routes_path
  end

end

feature 'visit routes page' do
  xscenario 'user visits routes page' do
    visit 'routes?variable=40.7063634,-74.00909630000001'
    expect(page).to have_content('Closest stations:')
  end

  xscenario 'user should not see station options on initial visit' do
    visit root_path
    expect(page).to have_no_css('div.closest-station-option')
  end

  xscenario 'user should see station options when submitting address' do
    visit root_path
    #address input field needs the id 'submit-address-form'
    fill_in "",:with => '48 Wall Street, New York, NY 10015'
    click_button("")
  end

  xscenario 'maps should be hidden until station is clicked' do

  end

  xscenario 'maps should be displayed station is clicked' do

  end

  xscenario 'stations should include service status updates' do

  end

  xscenario 'stations should include distance' do
    # visit path
    expect(page).to have_css('h3.stationName')
  end

end

feature 'visit other_resource page' do
  scenario 'visits other_resource page' do
    visit other_resources_path
    expect(page).to have_text("Other Resources")
  end

  scenario 'visits other_resource page to view map' do
    visit other_resources_path
    expect(page).to have_css("img")
  end
end

feature 'visit other_resource page' do

  scenario 'user sees MTA Resources' do
    visit other_resources_path
    expect(page).to have_content("MTA Resources")
  end

  xscenario 'user sees revealed MTA Resources links' do
    visit other_resources_path
    click_link("MTA Resources")
    expect(page).to have_content("mta.info | Accessibility")
  end

  scenario 'user sees NYC Resources' do
    visit other_resources_path
    expect(page).to have_content("NYC Resources")
  end



  xscenario 'user sees revealed NYC Resources links' do
    visit other_resources_path
    find(".nyc-resources").click
    expect(page).to have_content("NYC Mayor's Office For People with Disabilities")
  end

  xscenario 'user sees revealed NYC Resources links' do
    visit other_resources_path
    click_link("NYC Resources")
    expect(page).to have_content("mta.info | Accessibility")

  end

  scenario 'user sees Government Resources' do
    visit other_resources_path
    expect(page).to have_content("Government Resources")
  end

  xscenario 'user sees revealed Government Resources links' do
    visit other_resources_path
    find(".government-resources").click
    expect(page).to have_content("ADA.gov")
  end

  scenario 'user sees Route Information (pdf)' do
    visit other_resources_path
    expect(page).to have_content("Route Information (pdf)")
  end


  xscenario 'user sees revealed MTA Resources links' do
    visit other_resources_path
    find("h2.mta-resources").click
    expect(page).to have_content("mta.info | Accessibility")
  end
end


feature 'visit About page' do
  scenario 'visits About page' do
    visit about_index_path
    expect(page).to have_text("Our Mission")
  end
end




    # visit root_path (find a station)

#     expect page text to include "Enter Your Location"
#     expect page to have geolocation object
#     (stub four stations to make them appear)
#     expect page to have a input box powered by Google to input
#     expect to click the input box, user can enter an address or have location detected
#     expects to click and four divs appear for each option
#     expect each div to have a route name and distance
#     expect to see service status icon in divs
#       expect to click on div and see map


# resources page
# expect a map
# expect a list of clickable resources
# expect separation by boroughs


# about page
# mission
# what makes us unique
# includes feedback form?


#     expect a nav

#     click_link 'Sign-Up'
#     fill_in 'Username', :with => 'John'
#     fill_in 'Email', :with => 'john@example.com'
#     fill_in 'Password', :with => 'password'
#     click_button 'Create'
#     expect(page).to have_content "Logout"
#   end