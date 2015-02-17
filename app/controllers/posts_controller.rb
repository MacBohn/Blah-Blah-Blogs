class PostsController < ApplicationController
  def index
    @posts = Post.all
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
