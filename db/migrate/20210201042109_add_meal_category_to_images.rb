class AddMealCategoryToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :meal_category, :string
  end
end
