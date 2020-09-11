class Post < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	attachment :image
	validates :title, presence: true
	validates :address, presence: true

    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    is_impressionable counter_cache: true

    def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end
end
