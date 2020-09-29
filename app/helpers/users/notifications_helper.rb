module Users::NotificationsHelper

	# 通知お知らせ
	def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
    end

end
