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
      expect(find('form')).to have_content('Status')
    end
  end
end