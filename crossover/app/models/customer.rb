class Customer < ActiveRecord::Base
  belongs_to :order
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :id
end
