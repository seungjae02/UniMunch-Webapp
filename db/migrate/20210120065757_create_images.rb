class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.text :description
      t.text :instructions
      t.text :ingredients
      t.integer :cookingtime

      t.timestamps
    end
  end
end
