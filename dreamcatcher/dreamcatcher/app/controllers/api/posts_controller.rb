class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render "index"
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user ? current_user.id : 1
    @post.save!

    render :json =>  {:post => 'created a post' }.to_json
  end

  def update
  end

  def destroy
  end

  private

  def post_params
      params.require(:post).permit(:front, :back)
  end
end
