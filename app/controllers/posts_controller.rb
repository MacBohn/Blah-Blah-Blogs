class PostsController < ApplicationController
  def index
    if params[:category_id]
      @posts = Post.where(:category_id => params[:category_id])
    else
      @posts = Post.all
    end
    @post =Post.new
  end


  def create
    @post= Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

end
