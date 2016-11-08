class AddIndexToEmail < ActiveRecord::Migration
  def change
    add_index :customers, :email
  end
end
