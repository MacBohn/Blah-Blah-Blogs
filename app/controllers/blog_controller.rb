class BlogController < ApplicationController
  def index
    @post = Post.new
    
  end

end
