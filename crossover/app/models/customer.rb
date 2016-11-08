class Customer < ActiveRecord::Base
  has_many :orders
  belongs_to :product
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :id
end
