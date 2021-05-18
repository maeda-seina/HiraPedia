# frozen_string_literal: true

module Users
  module NotificationsHelper
    # 通知お知らせ
    def unchecked_notifications
      @notifications = current_user.passive_notifications.where(checked: false)
    end
  end
end
