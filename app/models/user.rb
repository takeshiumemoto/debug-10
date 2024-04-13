class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :books, dependent: :destroy
    validates :title, presence: true
    validates :body, presence: true
    


 def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
 end
end