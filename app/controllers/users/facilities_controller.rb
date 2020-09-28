class Users::FacilitiesController < ApplicationController
	before_action :authenticate_user!
  def index
    @facilities = Facility.all.page(params[:page]).per(6)
    @most_viewed = Facility.order('impressions_count DESC').take(10)
  end

  def show
    @facility = Facility.find(params[:id])
    impressionist(@facility, :unique => [:session_hash])
  end
end
