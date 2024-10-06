class CourseController < ApplicationController
  def create
    begin
      course = CourseService::Creator.new(params).execute
      render json: {}, status: :created
    rescue ActionController::ParameterMissing => error
      render json: error.message, status: :bad_request
    end
  end

  def destroy
    begin
      CourseService::Destroyer.new(params).execute
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound => error
      render json: error.message, status: :not_found
    end
  end
end