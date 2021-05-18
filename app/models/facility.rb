# frozen_string_literal: true

class Facility < ApplicationRecord
  validates :name, presence: true
  attachment :image

  # GoogleAPI
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # ランキング機能
  is_impressionable counter_cache: true
end
