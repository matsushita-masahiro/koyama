class User < ApplicationRecord
    has_many :posts
    validates :user_name, {presence: true}
    validates :email, {presence: true}
    validates :password, {presence: true}
    
    scope :get_by_name, ->(name) {
        where("user_name like ?" , "%#{name}%")
    }
end
