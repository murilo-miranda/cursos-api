module CourseService
  class Destroyer
    def initialize(params)
      @id = params.fetch(:id)
    end

    def execute
      course = Course.find(@id)
      course.destroy
    end
  end
end