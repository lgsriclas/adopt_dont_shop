class PetApplicationsController < ApplicationController
  def index
    @pet_applications = PetApplication.all
  end

  def create
    PetApplication.create!(application: Application.find(params[:application]), pet: Pet.find(params[:pet]))
    redirect_to "/applications/#{params[:application]}"
  end
end