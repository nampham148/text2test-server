class CreateFillInQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :fill_in_questions do |t|
      t.string :question, null: false
      t.string :answer, null: false

      t.integer :course_id, null: false

      t.timestamps
    end
  end
end
