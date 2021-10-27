require 'rails_helper'

RSpec.describe 'the application show page' do
  it "shows the application and all it's attributes" do
    application = Application.create(name: 'Larry Sanders', address: '22 Shadowbrook Way Mendham, NJ 07945', home_description: "Looks great", status: "Pending")

    visit "/applications/#{application.id}"
    expect(page).to have_content(application.name)
    expect(page).to have_content(application.address)
    expect(page).to have_content(application.home_description)
    expect(page).to have_content(application.status)
    expect(page).to have_content("Pets")
  end

  it "can search for adoptable pets" do
    application = Application.create(name: 'Larry Sanders', address: '22 Shadowbrook Way Mendham, NJ 07945', home_description: "Looks great", status: "Pending")
    shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    shelter_2.pets.create(name: 'Beethoven', breed: 'saint bernard', age: 2, adoptable: false)
    shelter_2.pets.create(name: 'Lobster', breed: 'doberman', age: 3, adoptable: true)

    visit "/applications/#{application.id}"

    expect(page).to have_content("Add a pet to this application:")
    expect(page).to have_button("Search")

    fill_in 'Search', with: "Lobster"
    click_button("Search")

    expect(page).to have_content("Lobster")
    expect(page).to have_button("Adopt this pet")
    expect(page).to_not have_content("Beethoven")
  end

  it 'can add pets to an application' do
    application = Application.create(name: 'Larry Sanders', address: '22 Shadowbrook Way Mendham, NJ 07945', home_description: "Looks great", status: "Pending")
    shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    shelter_2.pets.create(name: 'Beethoven', breed: 'saint bernard', age: 2, adoptable: false)
    shelter_2.pets.create(name: 'Lobster', breed: 'doberman', age: 3, adoptable: true)

    visit "/applications/#{application.id}"

    fill_in 'Search', with: "Lobster"
    click_button("Search")
    click_button("Adopt this pet")

    expect(page).to have_content("Submit Your Application")
    expect(page).to have_content("Please describe why you would make a good pet owner:")
    expect(page).to have_link("Lobster")
    expect(page).to_not have_link("Beethoven")
    expect(page).to have_button("Search")
    expect(page).to have_button("Submit Application")
  end

  it 'can submit an application' do
    application = Application.create(name: 'Larry Sanders', address: '22 Shadowbrook Way Mendham, NJ 07945', home_description: "Looks great", status: "Pending")
    shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    shelter_2.pets.create(name: 'Beethoven', breed: 'saint bernard', age: 2, adoptable: false)
    shelter_2.pets.create(name: 'Lobster', breed: 'doberman', age: 3, adoptable: true)

    visit "/applications/#{application.id}"

    fill_in 'Search', with: "Lobster"
    click_button("Search")
    click_button("Adopt this pet")
  end
end