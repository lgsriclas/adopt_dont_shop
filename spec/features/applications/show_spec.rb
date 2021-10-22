require 'rails_helper'

RSpec.describe 'the application show' do
  it "shows the application and all it's attributes" do
    application = Application.create(name: 'Larry Sanders', address: '22 Shadowbrook Way Mendham, NJ 07945')

    visit "/applications/#{application.id}"

    expect(page).to have_content(application.name)
    expect(page).to have_content(application.address)
    expect(page).to have_content(application.home_description)
    expect(page).to have_content(application.status)
  end
end