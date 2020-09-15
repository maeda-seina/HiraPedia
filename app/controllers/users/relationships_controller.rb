class Users::RelationshipsController < ApplicationController
  # before_action :set_post
  def create
  	follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @user = User.find(params[:user_id])
    # @user = User.find(params[:relationship][:following_id])
    @user.create_notification_follow!(current_user)

    # redirect_to request.referer
  end
  # ⑤ここでpostが不要になったのでset_post無くした。
  # そして@userを定義した。=>これでpostのshowの方はフォローする外すだけやったから
  # うまくいったけど、usersのshowの方は、フォロワー数とかの数字を変えないといけないから
  # その数字の部分は_relationshipのrenderの中に含まれてないから、どうしよってなった。=>usersのshowへ
  # ⑨別件で通知機能を並行していたのだが、@user = User.find(params[:relationship][:following_id])が機能してなかったのだが、
  # ここで4行目から、[:relationship][:following_id] = [:user_id]となっていたから、@user = User.find(params[:user_id])で済んだ。

  def destroy
  	follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    @user = User.find(params[:user_id])
    # redirect_to request.referer
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
