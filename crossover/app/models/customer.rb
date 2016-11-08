class Customer < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :authentication_tokens
  belongs_to :product
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :email
  validates_presence_of :password
  # validates :password, length: { minimum: 8 }


end
