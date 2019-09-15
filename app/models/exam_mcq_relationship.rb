class ExamMcqRelationship < ApplicationRecord
  belongs_to :mock_exam
  belongs_to :mcq_question
end
