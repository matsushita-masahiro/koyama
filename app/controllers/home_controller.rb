class HomeController < ApplicationController
  
  def top
    @sentence = Sentence.pluck(:proverb).sample(1)
    @posts = Post.all.order(created_at: :desc).first(3)
    
  end
  
  def cooking
  end
  
  def health
  end
  
  def learning
  end
  
  def life
  end
  
  def mom
  end
  
  def out
  end
  
  def trip
  end
  
  def sentences
    @sentences = Sentence.all
  end
  
  def create
    @sentence = Sentence.new(proverb: params[:text])
    @sentence.save
    redirect_to("/sentences")
  end
end
