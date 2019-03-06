class AddBadgesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :badge, foreign_key: { to_table: :user_badges }
  end
end
