class HomeController < ApplicationController
  before_action :authenticate_user, {only: [:learning, :health, :cooking, :out, :life, :trip, :mom, :cooking_recipe, :cooking_ingredient]}
  before_action :forbid_login_user, {only: [:sign_up, :login, :top]}
  def top
    @sentence = Sentence.pluck(:proverb).sample(1)
    @posts = Post.all.order(created_at: :desc).first(3)
  end
  
  def learning
    @posts = Post.where(category: "がくしゅう").order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end
  
  def health
    @posts = Post.where(category: "けんこう").order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end
  
  def cooking
    @posts = Post.where(category: "りょうり").order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end
  
  def out
    @posts = Post.where(category: "おでかけ").order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end
  
  def life
    @posts = Post.where(category: "くらし").order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end
  
  def trip
    @posts = Post.where(category: "りょこう").order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end
  
  def mom
    @posts = Post.where(category: "etc.").order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end
  
  def sentences
    @sentences = Sentence.all
  end
  
  def create
    @sentence = Sentence.new(proverb: params[:text])
    @sentence.save
    redirect_to("/sentences")
  end
  
  def learning_create
    @survey = Survey.new(
      user_id: @current_user.id,
      question_1: params[:question_1],
      question_2: params[:question_2],
      menu: "learning"
      )
    @survey.save
    redirect_to("/learning")
  end
  
  def health_create
    @survey = Survey.new(
      user_id: @current_user.id,
      question_1: params[:question_1],
      question_2: params[:question_2],
      menu: "health"
      )
    @survey.save
    redirect_to("/health")
  end
  
  def cooking_create
    @survey = Survey.new(
      user_id: @current_user.id,
      question_1: params[:question_1],
      question_2: params[:question_2],
      menu: "cooking"
      )
    @survey.save
    redirect_to("/cooking")
  end
  
  def out_create
    @survey = Survey.new(
      user_id: @current_user.id,
      question_1: params[:question_1],
      question_2: params[:question_2],
      menu: "out"
      )
    @survey.save
    redirect_to("/out")
  end
  
  def life_create
    @survey = Survey.new(
      user_id: @current_user.id,
      question_1: params[:question_1],
      question_2: params[:question_2],
      menu: "life"
      )
    @survey.save
    redirect_to("/life")
  end
  
  def trip_create
    @survey = Survey.new(
      user_id: @current_user.id,
      question_1: params[:question_1],
      question_2: params[:question_2],
      menu: "trip"
      )
    @survey.save
    redirect_to("/trip")
  end
  
  def mom_create
    @survey = Survey.new(
      user_id: @current_user.id,
      question_1: params[:question_1],
      question_2: params[:question_2],
      menu: "etc"
      )
    @survey.save
    redirect_to("/mom")
  end
  
  def cooking_recipe
  end
  
  def cooking_ingredient
    @current_user.check_boxes.build
    @recipes = Recipe.where(menu_title: "2018年11月1週目")
    
   
    
  end
  
  def check_box_create
    @check = Checkbox.new
  end
  
  def login
  end
  
  def sign_up
  end
  
end
