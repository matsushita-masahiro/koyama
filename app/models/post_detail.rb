class PostDetail < ApplicationRecord
    validates :content, {presence: true}
end
