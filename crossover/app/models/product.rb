class Product < ActiveRecord::Base
  validates_presence_of :id
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :name
  has_many :order_lines
end
