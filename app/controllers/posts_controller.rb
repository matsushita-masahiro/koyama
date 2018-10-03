class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
    @post.post_details.build
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    @details = PostDetail.where(post_id: @post.id)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    # @user = User.find_by(id: @post.user_id)
    @likes_count = Like.where(post_id: @post.id).count
    @comments = Comment.where(post_id: @post.id)
  end
  
  
  def destroy
      @post =Post.find_by(id: params[:id])
      @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
  end
  
  
  def create
      @post = Post.new(
      category: post_params[:category],
      title: post_params[:title],
      main_content: post_params[:maincdcd],
      user_id: @current_user.id
      )
      
    logger.debug("ssssssssssssssssssssss #{post_params[:post_details_attributes][0][:content]}")
    # if @post.save
    #         @post = Post.all.order(created_at: :desc).first
      
    #   i = 0
    # post_params.post_details_attributes.each do |i|.present? do
    #       @detail = PostDetail.new(
    #       post_id: @post.id,
    #       content: params["content-#{content_cnt}"],
    #       image: "kids.jpg"
    #       )
    #       logger.debug("------ content ----- > #{params["content-#{content_cnt}"]}")
    #             if params["image-#{content_cnt}"]
    #               @detail.save
    #                   @detail = PostDetail.all.order(created_at: :desc).first
    #                   # 画像保存ディレクトリ
    #                   save_path = "public/post_images/#{@post.user_id}/#{@detail.post_id}"
    #                   # public/user_id/post_idディレクトリ無ければ作成
    #                   FileUtils.mkdir_p(save_path) unless FileTest.exist?(save_path)
    #                     @detail.image = "#{@detail.id}.jpg"
    #                     @detail.save
    #                     image = params["image-#{content_cnt}"]
    #                     File.binwrite("#{save_path}/#{@detail.image}", image.read)
    #                   logger.debug("ssssssssssssssssssssss")
    # logger.debug("#{params[:title]}")
    #             else
    #               logger.debug("xxxxxxxxxxxxxx")
    # logger.debug("#{params[:title]}")
    #             @detail.save
    #             end
          
    #       content_cnt += 1
    #   end
      # flash[:notice] = "投稿できました"
      # redirect_to("/posts/index")
      # else
      # render("/posts/new")
    # end
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(update_post_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  
  private
  def find_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :main_content, post_details_attributes: [:id, :content, :image])
  end
  
  def update_post_params
    params.require(:post).permit(:title, :main_content,members_attributes: [:id, :content, :image])
  end

end  
  # def create
  #   @post = Post.new(
  #     category: params[:category],
  #     title: params[:title],
  #     main_content: params[:maincdcd],
  #     user_id: @current_user.id
  #     )
   
  #   if @post.save
  #     @post = Post.all.order(created_at: :desc).first
      
  #     content_cnt = 0
  #     while params["content-#{content_cnt}"].present? do
  #         @detail = PostDetail.new(
  #         post_id: @post.id,
  #         content: params["content-#{content_cnt}"],
  #         image: "kids.jpg"
  #         )
  #         logger.debug("------ content ----- > #{params["content-#{content_cnt}"]}")
  #               if params["image-#{content_cnt}"]
  #                 @detail.save
  #                     @detail = PostDetail.all.order(created_at: :desc).first
  #                     # 画像保存ディレクトリ
  #                     save_path = "public/post_images/#{@post.user_id}/#{@detail.post_id}"
  #                     # public/user_id/post_idディレクトリ無ければ作成
  #                     FileUtils.mkdir_p(save_path) unless FileTest.exist?(save_path)
  #                       @detail.image = "#{@detail.id}.jpg"
  #                       @detail.save
  #                       image = params["image-#{content_cnt}"]
  #                       File.binwrite("#{save_path}/#{@detail.image}", image.read)
  #                     logger.debug("ssssssssssssssssssssss")
  #   logger.debug("#{params[:title]}")
  #               else
  #                 logger.debug("xxxxxxxxxxxxxx")
  #   logger.debug("#{params[:title]}")
  #               @detail.save
  #               end
          
  #         content_cnt += 1
  #     end
  #     flash[:notice] = "投稿できました"
  #     redirect_to("/posts/index")
  #   else
  #     @post.destroy
  #     render("/posts/new")
  #   end
  # end   
 
  
     
    
  
    
 
  
  
  
  # def update
  #   @post = Post.find_by(id: params[:id])
  #   @post.category = params[:category]
  #   @post.title = params[:title]
  #   @post.main_content = params[:main]
  #   @detail = PostDetail.find_by(post_id: @post.id)
  #   # @detail = PostDetail.find_by(id: params[:id])
  #   @detail.content = params[:content]
  #   if params[:image]
  #       # 画像保存ディレクトリ
  #       save_path = "public/post_images/#{@post.user_id}/#{@detail.post_id}"
  #       # public/user_id/post_idディレクトリ無ければ作成
  #       FileUtils.mkdir_p(save_path) unless FileTest.exist?(save_path)
        
  #       @detail.image = "#{@detail.id}.jpg"
  #       image = params[:image]
  #       File.binwrite("#{save_path}/#{@detail.image}", image.read)
  #   end 
    
  #   if @post.save && @detail.save
  #     flash[:notice] = "編集できました"
  #     redirect_to("/posts/index")
  #   else
  #     render("/posts/edit")
  #   end
  # end
  

