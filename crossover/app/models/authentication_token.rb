class AuthenticationToken < ActiveRecord::Base
  belongs_to :customer
  has_secure_token :body
end
