class Product < ApplicationRecord
    #has_many_attached :images
    has_one_attached :image
    
    validates :name, presence: true,
                    length: { maximum: 300 }
end
