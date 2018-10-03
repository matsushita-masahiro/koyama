class HomeController < ApplicationController
  
  def top
    @sentence = Sentence.pluck(:proverb).sample(1)
    @posts = Post.all.order(created_at: :desc).first(3)
    
  end
  
  def learning
    @posts = Post.where(category: 3)
  end
  
  def health
    @posts = Post.where(category: 2)
  end
  
  def cooking
    @posts = Post.where(category: 3)
  end
  
  def out
    @posts = Post.where(category: 4)
  end
  
  def life
    @posts = Post.where(category: 5)
  end
  
  def trip
    @posts = Post.where(category: 6)
  end
  
  def mom
    @posts = Post.where(category: 7)
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
  end
  
end
