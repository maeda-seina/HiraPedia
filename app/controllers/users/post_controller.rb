class Users::PostController < ApplicationController


  def index
    @posts = Post.all.page(params[:page]).per(6)
    @most_viewed = Post.order('impressions_count DESC').take(10)
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def new
    @post = Post.new
  end





  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.all
    impressionist(@post, :unique => [:session_hash])
  end





  def create
    @post = Post.new(post_params)
    # 追加部分
    # user_idがフォームから来てないのでログインユーザーのを使用する
    # viewでhidden_fieldを使ってuser_idを渡してあげるか、コントローラで
    # 下のように記述してあげる必要がある。エラー文：User must exist.
    # なぜセーブできないかわからなかったから、save！を使うとエラ〜メッセージを出せることを利用した。そしたらUser must existが出た。
    # あとはpostテーブルにfavorite_idとpost_comment_idがあったが投稿した後に使うモノなので
    # 外部キーいらない。後null falseとなってたので一生saveできなかった可能性あった笑
    @post.user_id = current_user.id

    if @post.save
      redirect_to users_post_index_path
    else
      render 'new'
    end
  end



  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to users_user_path(current_user)
    else
    render 'edit'
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_user_path(current_user)
  end


  private
  def post_params
    params.require(:post).permit(:user_id, :title, :body, :address, :access, :image, :latitude, :longitude)
  end
end
