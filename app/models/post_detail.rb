class PostDetail < ApplicationRecord
    belongs_to :post
    # validates :content, {presence: true}
    mount_uploader :image, ImagesUploader
                          
end
