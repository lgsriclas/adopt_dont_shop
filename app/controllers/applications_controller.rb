class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def new
  end

  def create
    application = Application.new(application_params)

    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to "/applications/new"
      flash[:alert] = "Error: #{error_message(application.errors)}"

    end
  end

  def show
    @application = Application.find(params[:id])
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    if application.update(application_params)
      redirect_to "/applications/#{application.id}"
    else
      redirect_to "/applications/#{application.id}/edit"
    end
  end

  def destroy
    Application.find(params[:id]).destroy
    redirect_to '/pets'
  end

  private

  def application_params
    params.permit(:id, :name, :age, :address, :home_description, :status, :pet_id)
  end
end