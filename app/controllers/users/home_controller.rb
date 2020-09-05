class Users::HomeController < ApplicationController
	def top
	end

	def about
	end

	def guest
      user = User.find_or_create_by!(name: 'a', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to users_root_path, notice: 'ゲストユーザーとしてログインしました。'
	end
end
