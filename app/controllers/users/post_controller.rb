class Users::PostController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(6)
    # 閲覧数ランキングを表示
    @most_viewed = Post.order('impressions_count DESC').take(10)
    # いいねランキングを表示
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.all
    # 閲覧数を集計
    impressionist(@post, :unique => [:session_hash])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:success] = "登録が完了しました。"
      redirect_to users_post_index_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました。"
    redirect_to users_user_path(current_user)
    else
    render 'edit'
    end

  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
    if @user == @post.user
    render :edit
    else
    redirect_to users_user_path(current_user)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to users_user_path(current_user)
  end


  private
  def post_params
    params.require(:post).permit(:user_id, :title, :body, :address, :access, :image, :latitude, :longitude)
  end
end
