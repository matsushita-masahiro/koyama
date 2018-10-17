class UsersController < ApplicationController
    before_action :authenticate_user, {only: [:index, :show, :edit, :update, :invite, :friend]}
    before_action :forbid_login_user, {only: [:new, :create, :login]}
    before_action :ensure_correct_user, {only: [:edit, :update]}
    before_action :admin_user,     {only: [:destroy]}
  
  def index
      @users = User.paginate(page: params[:page], per_page: 15)
      if params[:name].present?
          @users = @users.get_by_name params[:name]
      end
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
  
  def create_friend
      @user = User.find_by(id: params[:id])
      @relationship = Relationship.new(
            follower_id: params[:id],
            followed_id: @current_user.id,
            status: "waite",
            comment: params[:comment]
            )
            logger.debug("xxxxxxxxxxxxxx#{params[:id]}")
    #   if @relationship.save
        #   flash[:notice] = "●●● リクエストしました ●●●"
        #   redirect_to("/users/#{@current_user.id}")
    #      else
    #       flash[:notice] = "●●● リクエストできませんでした ●●●"
    #       redirect_to("/users/index") 
    #   end
  end 
  
  def relationship
      @relationships = Relationship.where(follower_id:params[:id], followed_id:params[:id])
  end
  
  def show
      @user = User.find_by(id: params[:id])
      @likes = Like.where(user_id: @current_user.id)
      @posts = Post.where(user_id: @current_user.id)
      @comments = Comment.where(user_id: @current_user.id)
      @relationships = Relationship.where(status: "accept")
  end
  
  def create
   @user = User.new(
       user_name: params[:name],
       email: params[:email],
       password: params[:password], 
       comment: params[:comment],
       image:"face.png"
       ) 
       
    # respond_to do |format|
    #   if @user.save
    #     SampleMailer.send_when_create(@user).deliver
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
   
    
    if @user.save
        @user = User.all.order(created_at: :desc).first
        if params[:image]
              @user.image = "#{@user.id}.jpg"
              @user.save
              image = params[:image]
              File.binwrite("public/user_images/#{@user.image}", image.read)
        end
        session[:user_id] = @user.id
        flash[:notice] = "ようこそ！こそだて広場へ☆"
        redirect_to("/users/#{@user.id}")
    else
         @error_message = "画像とコメント以外は、すべて入力してね！"
         render("home/sign_up")
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed."
    redirect_to("/users/index")
  end
  
  def login
      @user = User.find_by(email: params[:email], password: params[:password])
      if @user
          session[:user_id] = @user.id
          flash[:notice] = "●●● おかえりなさい ●●●"
          redirect_to("/users/#{@user.id}")
      else
          @error_message = "メールアドレスまたはパスワードを再度確認してね!"
          @email = params[:email]
          @password = params[:password]
          render("home/login")
      end
  end
  
  def logout
        session[:user_id] = nil
        flash[:notice] = "●●● また来てね ●●●"
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
          logger.debug("ssssssssssssssssssssss")
      end
    
    
      if @user.save
        #   SampleMailer.send_when_update(@current_user).deliver
         flash[:notice] = "編集しました"
         redirect_to("/users/#{@user.id}")
      else
         render("/users/edit")
      end
  end
  
  def ensure_correct_user
      if @current_user.id != params[:id].to_i
          flash[:notice] = "権限がありません"
          redirect_to("/posts/index")
      end
  end  
    
  
  
#   def invite_create
#     SampleMailer.send_when_create.deliver
#         # format.html { redirect_to @user, notice: 'User was successfully created.' }
#         # format.json { render :show, status: :created, location: @user }
#   end

    private
    
    def admin_user
      redirect_to(root_path) unless @current_user.admin?
    end

end
