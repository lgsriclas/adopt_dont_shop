require "rails_helper"

RSpec.describe Application, type: :model do
  it 'has attributes' do
    larry = Application.create(name: 'Larry Sanders', address: '22 Shadowbrook Way Mendham, NJ 07945', home_description: "Looks great.")
    leslie = Application.create(name: 'Leslie Knope', address: '2358 Highland Ave Pawnee, IN 47906', home_description: "Dog friendly.")

    expect(larry.name).to eq("Larry Sanders")
    expect(leslie.name).to eq("Leslie Knope")
  end

  describe "relationships" do
    it { should have_many(:pet_applications) }
    it { should have_many(:pets).through(:pet_applications) }
  end
end