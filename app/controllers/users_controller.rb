class UsersController < ApplicationController
  
  def index
      @users =　User.where('user_name = ?', 'cc').id
    #   @users = User.all
    #   @user = User.find_by(id: params[:id])
  end
  
  
  def edit
      @user = User.find_by(id: params[:id])
  end
  
  def invite
      @user = User.find_by(id: params[:id])
  end
  
  def friend
      @user = User.find_by(id: params[:id])
  end
  
  def show
      @user = User.find_by(id: params[:id])
      @likes = Like.where(user_id: @current_user.id)
      @posts = Post.where(user_id: @current_user.id)
      @comments = Comment.where(user_id: @current_user.id)
  end
  
  def create
   @user = User.new(
       user_name: params[:name],
       email: params[:email],
       password: params[:password], 
       comment: params[:comment],
       image:"face.png"
       ) 
   
    
    if @user.save
        @user = User.all.order(created_at: :desc).first
        if params[:image]
              @user.image = "#{@user.id}.jpg"
              @user.save
              image = params[:image]
              File.binwrite("public/user_images/#{@user.image}", image.read)
        end
        session[:user_id] = @user.id
        flash[:notice] = "ようこそ！"
        redirect_to("/users/#{@user.id}")
    else
        render("/")
    end
  end
  
  def login
      @user = User.find_by(email: params[:email], password: params[:password])
      if @user
          session[:user_id] = @user.id
          flash[:notice] = "おかえりなさい"
          redirect_to("/users/#{@user.id}")
      else
          @error_message = "メールアドレスまたはパスワードを再度確認してね"
          @email = params[:email]
          @password = params[:password]
          render("/")
        # redirect_to("/cooking")
      end
  end
  
  def logout
        session[:user_id] = nil
        flash[:notice] = "また来てね"
        redirect_to("/")
      
  end 
  
  def update
      @user = User.find_by(id: params[:id])
      @user.user_name = params[:name]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.comment = params[:comment]
      
      if params[:image]
          @user.image = "#{@user.id}.jpg"
          image = params[:image]
          File.binwrite("public/user_images/#{@user.image}", image.read)
      end
    
      if @user.save
         flash[:notice] = "編集しました"
         redirect_to("/users/#{@user.id}")
      else
         render("/users/edit")
      end
  end
end