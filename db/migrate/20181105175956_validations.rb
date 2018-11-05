class Validations < ActiveRecord::Migration[5.2]
  def change
    change_column :tests, :title, :string, unique: true
    change_column :tests, :level, :integer, unique: true
  end
end
