class CourseController < ApplicationController
  def index
    serialized_courses = CourseSerializer.new(Course.active_date)
    render json: serialized_courses, status: :ok
  end

  def create
    begin
      course = CourseService::Creator.new(course_params).execute
      render json: {}, status: :created
    rescue ActionController::ParameterMissing => error
      render json: error.message, status: :bad_request
    end
  end

  def destroy
    begin
      CourseService::Destroyer.new(course_params).execute
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound => error
      render json: error.message, status: :not_found
    end
  end

  def update
    begin
      updated_course = CourseService::Editor.new(course_params).execute
      render json: { id: updated_course.id, title: updated_course.title, description: updated_course.description }, status: :ok
    rescue ActiveRecord::RecordNotFound => error
      render json: error.message, status: :not_found
    end
  end

  private

  def course_params
    params.permit(:id, :title, :description, :end_date)
  end
end
