class CourseController < ApplicationController
  def create
    course = CourseService::Creator.new(params).execute

    render json: {}, status: :created
  end
end