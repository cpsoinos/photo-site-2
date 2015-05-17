require 'rails_helper'

feature 'visits home page', %Q{
  As a guest
  I want to see photos on the home page
  So I can decide whether to continue browsing
} do

  scenario "guest lands on home page" do
    visit root_path

    expect(page).to have_link("Home")
    expect(page).to have_link("Photography")
    expect(page).to have_link("Design")
    expect(page).to have_link("About")
    expect(page).to have_content("Alex Wesley Brandt")
  end

  scenario "guest visits 'photography' page" do
    visit photographs_path

    expect(page).to have_link("Headshots")
    expect(page).to have_link("Weddings")
    expect(page).to have_link("People")
    expect(page).to have_link("Animals")
    expect(page).to have_link("Objects")
    expect(page).to have_link("World")
  end

  scenario "guest visits 'design' page" do
    #what content goes here?
  end

  scenario "guest visits 'about' page" do
    visit about_path

    expect(page).to have_content("About Wesley Brandt Photography")
    expect(page).to have_link("alex@wesleybrandt.com")
    expect(page).to have_content("About Alex")
  end

end
