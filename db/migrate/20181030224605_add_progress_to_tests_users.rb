class AddProgressToTestsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tests_users, :progress, :integer, default: 0
    add_column :tests_users, :creator, :boolean
  end
end
