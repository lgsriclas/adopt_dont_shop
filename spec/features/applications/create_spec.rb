require 'rails_helper'

RSpec.describe 'application creation' do
  before(:each) do
    @application = Application.create(name: 'Larry Sanders', address: '22 Shadowbrook Way Mendham, NJ 07945', home_description: "Looks great", status: "Pending")
  end

  describe 'the application new' do
    it 'renders the new form' do
      visit "/applications/new"

      expect(page).to have_content('New Application')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Address')
      expect(find('form')).to have_content('Home description')
    end
  end

  describe 'the application create' do
    context 'given valid data' do
      it 'creates the application and redirects to the application show page' do
        visit "/applications/new"

        fill_in 'Name', with: 'Larry Sanders'
        fill_in 'Address', with: '22 Shadowbrook Way Mendham, NJ 07945'
        fill_in 'Home description', with: 'My home is nice!'
        click_button 'Save'
        expect(page).to have_current_path(
          "/applications/#{@application.id}"
        )
        expect(page).to have_content('Larry Sanders')
      end
    end
  end
end