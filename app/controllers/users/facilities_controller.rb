class Users::FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
    @most_viewed = Facility.order('impressions_count DESC').take(10)
  end

  def show
    @facility = Facility.find(params[:id])
    impressionist(@facility, :unique => [:session_hash])
  end
end
