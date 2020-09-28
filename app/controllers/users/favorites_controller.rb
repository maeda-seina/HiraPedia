class Users::FavoritesController < ApplicationController

  before_action :set_post
  def create
  	favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
    # Ajaxで処理
    #redirect_to request.referer

    # 通知機能
    @post.create_notification_like!(current_user)
  end

  def destroy
  	favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
    # 非同期処理のため削除
    #redirect_to request.referer
  end

  def set_post
   @post = Post.find(params[:post_id])
 end
end
