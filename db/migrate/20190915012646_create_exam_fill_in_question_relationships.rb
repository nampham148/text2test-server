class CreateExamFillInQuestionRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_fill_in_question_relationships do |t|
      t.integer :mock_exam_id, null: false
      t.integer :fill_in_question_id, null: false

      t.string :answer
      t.boolean :correct

      t.timestamps
    end
  end
end
