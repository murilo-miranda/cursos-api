module CourseService
  class Creator
    def initialize(params)
      @title = params.fetch(:title)
      @description = params.fetch(:description)
    end

    def execute
      Course.create!(title: @title, description: @description, end_date: DateTime.now)
    end
  end
end
