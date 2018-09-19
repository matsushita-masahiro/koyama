class CommentsController < ApplicationController
   
   def create
    @comment = Comment.new(
        post_id: params[:post_id],
        user_id: @current_user.id,
        content: params[:content]
        )
    @comment.save
        redirect_to("/posts/#{params[:post_id]}")
   end
end

