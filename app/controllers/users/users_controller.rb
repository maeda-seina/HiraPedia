class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  # グラフ表示のため
  def index
  end

  def show
  	@user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(3)
    @favorite_posts = @user.favorite_posts.page(params[:page]).per(3)
    # DM機能
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    render :edit
    else
    redirect_to users_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to users_user_path(current_user)
    else
      render 'edit'
    end

  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
