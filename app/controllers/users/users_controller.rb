class Users::UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
