# frozen_string_literal: true

module Users
  class MessagesController < ApplicationController
    def create
      if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
        @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
        redirect_to request.referer
      else
        redirect_back(fallback_location: users_users_path)
      end
    end
  end
end
