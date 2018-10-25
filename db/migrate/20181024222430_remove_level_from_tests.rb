class RemoveLevelFromTests < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :level, :string
  end
end
