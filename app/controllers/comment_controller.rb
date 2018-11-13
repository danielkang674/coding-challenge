class CommentController < ApplicationController

  def index
    # Comment attribute of post from FK relationship
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    # Add a new `Comment` to the database
    Comment.create(comment_params)
    # Redirect to home route
    redirect_to posts_url
  end

  def delete
    # Remove a `Comment` from the database
    Comment.find(params[:id]).destroy
    redirect_to posts_url
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    # Update body attribute of comment instance
    if @comment.update_attributes(comment_edit)
      redirect_to posts_url
    else
      # Remain on edit view
      render :action => 'edit'
    end

  end


  private
  def comment_params
    # Params of new comment form
    params.permit(:body, :post_id)
  end

  def comment_edit
    # Params of edit comment form
    params.require(:comment).permit(:body)
  end
end
