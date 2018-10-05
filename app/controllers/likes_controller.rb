class LikesController < ApplicationController
    before_action :authenticate_user
    before_action :ensure_correct_user

def create
    @like = Like.new(
        post_id: params[:post_id],
        user_id: @current_user.id
        )
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
end

def destroy
    @like = Like.find_by(
    post_id: params[:post_id],
    user_id: @current_user.id
    )
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

end

