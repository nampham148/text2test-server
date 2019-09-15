class CourseMembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    puts params
    course = Course.find_by(course_id: params[:course_membership][:course_id])
    if course.nil?
      flash[:notice] = "Course does not exist"
      render "static_pages/home"
    else
      membership = CourseMembership.create(course: course, user: current_user)
      redirect_to course
    end
  end

end
