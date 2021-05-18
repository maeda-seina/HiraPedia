# frozen_string_literal: true

module Users
  class FacilitiesController < ApplicationController
    before_action :authenticate_user!
    def index
      @facilities = Facility.all.page(params[:page]).per(6)
      # ランキング機能表示
      @most_viewed = Facility.order('impressions_count DESC').take(10)
    end

    def show
      @facility = Facility.find(params[:id])
      # ランキング機能集計
      impressionist(@facility, unique: [:session_hash])
    end
  end
end
