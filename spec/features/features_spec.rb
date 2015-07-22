require 'rails_helper'

feature 'visit root page' do

  scenario 'user visits root page', js: true   do
    visit root_path
    save_and_open_page
    expect(page).to have_selector("input#autocomplete")
  end

  scenario 'user expects input field on root page' do
    visit root_path
    expect(page).to have_selector("input")
  end

  xscenario 'user should see station options when submitting address', js:true do
    visit root_path
    fill_in "#autocomplete",:with => '48 Wall Street, New York, NY 10015'
    expect(page).to redirect_to #routes_path
  end

end

feature 'visit routes page' do
  xscenario 'user should not see station options on initial visit' do
    visit root_path
    expect(page).to have_no_css #add selectors
  end

  scenario 'user should see station options when submitting address' do
    visit 'routes?variable=40.7062387,-74.00943459999999'
    expect(page).to have_css('.stationName1')
  end

  xscenario 'maps should be hidden until station is clicked' do

  end

  xscenario 'maps should be displayed station is clicked' do

  end

  xscenario 'stations should include service status updates' do
    visit '/routes?variable=40.7585757,-73.98570899999999'
    expect(page).to have_content('Status')

  end

  scenario 'stations should include distance' do
    visit '/routes?variable=40.7585757,-73.98570899999999'
    expect(page).to have_content('miles')
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

  scenario 'user sees MTA Resources' do
    visit other_resources_path
    expect(page).to have_content("MTA Resources")
  end

  scenario 'user sees NYC Resources' do
    visit other_resources_path
    expect(page).to have_content("NYC Resources")
  end

  scenario 'user sees Government Resources' do
    visit other_resources_path
    expect(page).to have_content("Government Resources")
  end

  scenario 'user sees Route Information (pdf)' do
    visit other_resources_path
    expect(page).to have_content("Route Information (pdf)")
  end
end

feature 'visit About page' do
  scenario 'visits About page' do
    visit about_index_path
    expect(page).to have_text("Our Mission")
  end
end


