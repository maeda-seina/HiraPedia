class Users::RelationshipsController < ApplicationController
  def create
  	follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    # 通知機能
    @user = User.find(params[:user_id])
    @user.create_notification_follow!(current_user)
    # Ajaxで処理
    # redirect_to request.referer
  end

  def destroy
  	follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    @user = User.find(params[:user_id])
    # Ajaxで処理
    # redirect_to request.referer
  end


end
