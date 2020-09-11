class Facility < ApplicationRecord
	validates :name, presence: true
	attachment :image

	geocoded_by :address
    after_validation :geocode, if: :address_changed?

    is_impressionable counter_cache: true
end
