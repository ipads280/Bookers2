class Book < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  has_many :favorites
  
  validates :title, presence: true
  validates :body, presence: true, length:{maximum:200}
  has_many :book_comments, dependent: :destroy
  
 def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
 end
  
end
