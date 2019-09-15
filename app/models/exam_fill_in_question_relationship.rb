class ExamFillInQuestionRelationship < ApplicationRecord
  belongs_to :mock_exam
  belongs_to :fill_in_question
end
