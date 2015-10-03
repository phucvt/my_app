class AddAreaToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :area, :float
  end
end
