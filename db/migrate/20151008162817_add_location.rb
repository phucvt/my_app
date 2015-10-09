class AddLocation < ActiveRecord::Migration
  def change
    add_column :posts, :location_id, :int
  end
end
