class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.integer :test_id

      t.timestamps
    end
  end
end
