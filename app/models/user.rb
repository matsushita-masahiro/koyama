class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :relationships, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_users, through: :relationships, source: :followed
    has_many :reverse_relationships, foreign_key: "followed_id",
                                    class_name: "Relationship",
                                    dependent: :destroy
    has_many :followers, through: :reverse_relationships
    validates :user_name, {presence: true}
    validates :email, {presence: true}
    validates :password, {presence: true}
    
    scope :get_by_name, ->(name) {
        where("user_name like ?" , "%#{name}%")
    }
    
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id, status: 'waite', comment: params[:comment])
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end


end
