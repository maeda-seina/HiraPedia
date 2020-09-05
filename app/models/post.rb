class Post < ApplicationRecord
	belongs_to :user
	has_many :favorites
	has_many :post_comments
	attachment :image
	validates :title, presence: true
	validates :address, presence: true

    geocoded_by :address
    after_validation :geocode, if: :address_changed?
end
