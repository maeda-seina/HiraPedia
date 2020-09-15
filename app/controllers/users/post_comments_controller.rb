class Users::PostCommentsController < ApplicationController

  before_action :set_post
  def create
  	@post = Post.find(params[:post_id])
  	post_comment = current_user.post_comments.new(post_comment_params)
  	post_comment.post_id = @post.id
    post = post_comment.post
    if post_comment.save
      post.create_notification_comment!(current_user, post_comment.id)
    else
      render 'post/show'
    end

  	# if post_comment.save
  	#    redirect_to request.referer
  	# end
   end

  def destroy
  	post = Post.find(params[:post_id])
  	post_comment = post.post_comments.find(params[:id])
  	post_comment.destroy
  	# redirect_to request.referer
  end

  private
  def post_comment_params
  	params.require(:post_comment).permit(:comment)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
