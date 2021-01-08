class Question < ApplicationRecord

  belongs_to :user
  attachment :image

  validates :title, presence: true
  
end
