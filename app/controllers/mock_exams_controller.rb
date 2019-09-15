class MockExamsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def show
    @mock_exam = MockExam.find(params[:id])
  end

  def create
    @mock_exam = MockExam.create(name: params[:mock_exam][:name], course_id: "1", user_id: current_user.id)

    # grab the questions
    @questions = @mock_exam.course.fill_in_questions

    @questions.each do |question|
      if rand() > 0.5
        @mock_exam.exam_fill_in_questions << question
      end
    end

    # redirect to the exam
    redirect_to @mock_exam
  end

  def submit
    @mock_exam = MockExam.find(params[:id])
    puts params
    answers = params[:anything]
    
    num_question = 0
    num_correct_answer = 0

    puts "YOOOOOOOOOO"
    puts answers

    answers.each do |key, value|
      correct_answer = FillInQuestion.find(key).answer
      num_question += 1
      rela = ExamFillInQuestionRelationship.find_by(mock_exam_id: @mock_exam.id, fill_in_question_id: key)
      rela.update_attributes(answer: value)
      if correct_answer == value
        rela.update_attributes(correct: true)
        num_correct_answer += 1
      else
        rela.update_attributes(correct: false)
      end
    end

    @mock_exam.update_attributes(score: num_correct_answer, num_questions: num_question)
    render "mock_exams/result"
  end

end
