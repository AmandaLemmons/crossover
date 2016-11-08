class CustomerSerializer < ActiveModel::Serializer
   attributes :id, :firstname, :lastname, :email, :password
end
