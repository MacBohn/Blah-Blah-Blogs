class PostsController < ApplicationController
  def create
    @post = Post.create(title: params[:title], body: params[:body], user_id: current_user.id, category: params[:category])
  end

end
