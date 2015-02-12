class PostsController < ApplicationController
  def index
    @post =Post.new
  end


  def create
    @post= Post.new(post_params)
    @post.save
    redirect_to blog_path
  end

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

end
