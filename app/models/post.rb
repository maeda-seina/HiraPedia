class Post < ApplicationRecord
	belongs_to :user
	has_many :favorites
	has_many :post_comments
	attachment :image
	validaates :title, presence: true
	validaates :address, presence: true
end
