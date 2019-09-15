class MockExam < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :exam_mcq_relationships
  has_many :mcq_questions, through: :exam_mcq_relationships

  has_many :exam_fill_in_question_relationships
  has_many :exam_fill_in_questions, through: :exam_fill_in_question_relationships, source: :fill_in_question
end
