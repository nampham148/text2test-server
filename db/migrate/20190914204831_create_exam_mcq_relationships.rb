class CreateExamMcqRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_mcq_relationships do |t|
      t.integer :mock_exam_id, null: false
      t.integer :mcq_question_id, null: false

      t.integer :answer
      t.timestamps
    end

    add_index :exam_mcq_relationships, :mock_exam_id
    add_index :exam_mcq_relationships, :mcq_question_id
  end
end
