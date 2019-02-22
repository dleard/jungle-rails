class Review < ActiveRecord::Base
  validates :product_id, :user_id, presence: true
  validates_presence_of :rating, :unless => :description?
  validates_presence_of :description, :unless => :rating?
  belongs_to :product
  belongs_to :user
end
