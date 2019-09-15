class Course < ApplicationRecord
  has_many :notes
  has_many :mcq_questions
  has_many :flashcards

  has_many :course_memberships
  has_many :users, through: :course_memberships

  has_many :fill_in_questions
end
