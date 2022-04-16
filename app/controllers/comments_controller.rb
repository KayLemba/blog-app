class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], user: current_user)

    respond_to do |format|
      format.html do
        if comment.save
          flash[:notice] = 'Comment was successfully created.'
        else
          flash[:alert] = 'Failed to add comment!'
        end
        redirect_to user_post_path(post.user.id, post.id)
      end
    end
  end

  def destroy
    comment = Comment.find params[:id]

    respond_to do |_format|
      if comment.destroy
        flash[:notice] = 'Comment deleted!'
      else
        flash[:alert] = 'Failed to delete comment!'
      end
    end
  end


  def comments
    post = Post.find(params[:id])

    respond_to do |format|
      format.json { render json: post.comments }
    end
  end

  def add_comment
    comment = Comment.new(author: @current_user, post_id: params[:post_id], text: params[:text])

    respond_to do |format|
      if comment.save
        format.json { render json: comment }
      else
        format.json { render json: { success: false, message: comment.errors.full_messages } }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
