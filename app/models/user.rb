# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]
  attachment :image

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :post_comments, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  validates :name, presence: true

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def create_notification_follow!(current_user)
    # すでに「フォロー」されているか検索
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ? ', current_user.id, id, 'follow'])
    # フォローされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
