class Question < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  attachment :image

  validates :title, presence: true

end
