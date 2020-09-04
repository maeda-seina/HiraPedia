class Facility < ApplicationRecord
	validates :name, presence: true
	attachment :image
end
