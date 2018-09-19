class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    @details = PostDetail.where(post_id: @post.id)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @likes_count = Like.where(post_id: @post.id).count
    @comments = Comment.where(post_id: @post.id)
  end
  
  def create
    @post = Post.new(
      category: params[:category],
      title: params[:title],
      main_content: params[:main],
      user_id: @current_user.id
      )
     logger.debug("xxxxxxxxxxxxxx")
     logger.debug("#{params[:title]}")
    if @post.save
        @post = Post.all.order(created_at: :desc).first
        @detail = PostDetail.new(
          post_id: @post.id, 
          content: params[:content],
          image: "kids.jpg"
          
          # 初期写真が入らない
          )
            
         
      if @detail.save
        @detail = PostDetail.all.order(created_at: :desc).first
          if params[:image]
            
            # 画像保存ディレクトリ
            save_path = "public/post_images/#{@post.user_id}/#{@detail.post_id}"
            # public/user_id/post_idディレクトリ無ければ作成
            FileUtils.mkdir_p(save_path) unless FileTest.exist?(save_path)
            
              @detail.image = "#{@detail.id}.jpg"
              @detail.save
              image = params[:image]
              File.binwrite("#{save_path}/#{@detail.image}", image.read)
              
            # else
              
            #   @detail.save
          end 
        flash[:notice] = "投稿できました"
        redirect_to("/posts/index")
      else
        @post.destroy
        render("/posts/new")
      end
    else
      render("/posts/new")
   end   
   
  end
  
     
    
  
    
  def destroy
      @post =Post.find_by(id: params[:id])
      @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.main_content = params[:main]
    @detail = PostDetail.find_by(post_id: @post.id)
    # @detail = PostDetail.find_by(id: params[:id])
    @detail.content = params[:content]
    if params[:image]
        # 画像保存ディレクトリ
        save_path = "public/post_images/#{@post.user_id}/#{@detail.post_id}"
        # public/user_id/post_idディレクトリ無ければ作成
        FileUtils.mkdir_p(save_path) unless FileTest.exist?(save_path)
        
        @detail.image = "#{@detail.id}.jpg"
        image = params[:image]
        File.binwrite("#{save_path}/#{@detail.image}", image.read)
    end 
    
    if @post.save && @detail.save
      flash[:notice] = "編集できました"
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end
  
end
