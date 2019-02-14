class AddUsersToBadges < ActiveRecord::Migration[5.2]
  def change
    add_reference :badges, :user, foreign_key: { to_table: :user_badges }
  end
end
