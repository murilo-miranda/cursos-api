class CourseController < ApplicationController
  def create
    begin
      course = CourseService::Creator.new(params).execute
      render json: {}, status: :created
    rescue ActionController::ParameterMissing => error
      render json: error.message, status: :bad_request
    end
  end
end