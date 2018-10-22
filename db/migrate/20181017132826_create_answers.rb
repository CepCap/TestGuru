class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, null: false
      t.integer :question_id

      t.timestamps
    end
  end
end
