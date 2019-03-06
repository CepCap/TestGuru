class CreateUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :badge, foreign_key: { to_table: :badges }

      t.timestamps
    end
  end
end
