class RemovePhoneToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :phone, :integer
  end
end
