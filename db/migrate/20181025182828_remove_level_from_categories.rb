class RemoveLevelFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :level, :integer
  end
end
