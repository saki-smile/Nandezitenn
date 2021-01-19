class Inquiry
  include ActiveModel::Model
  
  attr_accesor :name, :email, :massage
  
  validates :name, presence: true
  validates :email, presence: true
  validates :massage, presence: true
end