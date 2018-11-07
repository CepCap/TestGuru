class CreateJoinTableUsersTests < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :tests do |t|
      t.index [:user_id, :test_id]
      t.index [:test_id, :user_id]
    end
  end
end
