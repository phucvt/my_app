class CreateCatelories < ActiveRecord::Migration
  def change
    create_table :catelories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
