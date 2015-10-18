class CreateCommends < ActiveRecord::Migration
  def change
    create_table :commends do |t|
      t.text :review
      t.integer :user_id
      t.integer :post_id
    end
  end
end
