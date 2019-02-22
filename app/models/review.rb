class Review < ActiveRecord::Base
  validates :product, :name, presence: true
  validates_presence_of :rating, :unless => :description?
  validates_presence_of :description :unless => rating?
end
