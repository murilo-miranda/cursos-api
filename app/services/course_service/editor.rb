module CourseService
  class Editor
    def initialize(params)
      @params = params
    end

    def execute
      course = Course.find(@params[:id])
      @params.delete(:id)
      course.update(@params)
      course
    end
  end
end
