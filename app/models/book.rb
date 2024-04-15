class Book < ApplicationRecord
    belongs_to :user
    has_one_attached :profile_image
    validates :title, presence: true
    validates :body, presence: true,length:{maximum: 200 }
    
    
    def get_image
        if profile_image.attached?
         profile_image
        else
        'no_image.jpg'
        end
    end
end 




