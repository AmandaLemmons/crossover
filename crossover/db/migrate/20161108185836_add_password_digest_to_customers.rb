class AddPasswordDigestToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :password_digest, :string
    add_column :customers, :password_confirmation, :string
  end
end
