class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :message
      t.references :user, index: true, foreign_key: { to_table :users }

      t.timestamps
    end
  end
end
