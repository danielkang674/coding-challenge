class PostsController < ApplicationController
  def index
    # Return all `Post`
    @posts = Post.all
  end

  def new
    # Return view to create a new Post
    @post = Post.new
  end

  def create
    # Add a new `Post` to the database
    @post = Post.new(post_params)

    # Post saved to db
    if @post.save
      redirect_to :action => 'index'
    else
      # Error in saving post
      render :action => 'new'
    end
  end

  def show
    # Show a single post
    @post = Post.find(params[:id])
  end

  def destroy
    # Remove a `Post` from the database
    Post.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private
  def post_params
    # Params of new post form
    params.require(:post).permit(:title, :body)
  end
end
