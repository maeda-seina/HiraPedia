class Users::RelationshipsController < ApplicationController
  before_action :set_post
  def create
  	follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    # @user = User.find(params[:relationship][:following_id])
    # @user.create_notification_follow!(current_user)
    # redirect_to request.referer
  end

  def destroy
  	follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    # redirect_to request.referer
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
