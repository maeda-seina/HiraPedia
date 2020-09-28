class Users::HomeController < ApplicationController
	def top
	end

	def about
	end

	# ゲストユーザー機能
	def guest
      user = User.find_or_create_by!(name: 'ゲスト', email: 'guest@hirapedia.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to users_post_index_path, notice: 'ゲストユーザーとしてログインしました。'
	end
end
