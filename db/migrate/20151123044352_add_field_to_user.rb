class AddFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :open_invite, :boolean
  end
end
