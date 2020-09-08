class Admins::FacilitiesController < ApplicationController

  def new
    @facility = Facility.new
  end

  def create
    @facility =Facility.new(facility_params)
    if @facility.save
      redirect_to admins_facilities_path
    else
      render 'new'
    end
  end

  def index
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    if @facility.update(facility_params)
      redirect_to admins_facility_path(@facility)
    else
    render 'edit'
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to admins_facility_path(@facility)
  end

  private
  def facility_params
    params.require(:facility).permit(:name, :body, :address, :access, :image, :latitude, :longitude)
  end
end
