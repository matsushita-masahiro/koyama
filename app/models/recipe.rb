class Recipe < ApplicationRecord
    has_many :check_boxes, dependent: :destroy
    has_many :users, through: :check_boxes
end
