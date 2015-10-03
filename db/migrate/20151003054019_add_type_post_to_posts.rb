class AddTypePostToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :type_post, :string
  end
end
