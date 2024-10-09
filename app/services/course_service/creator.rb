module CourseService
  class Creator
    def initialize(params)
      @title = params.fetch(:title)
      @description = params.fetch(:description)
      @end_date = params.fetch(:end_date)
    end

    def execute
      Course.create!(title: @title, description: @description, end_date: @end_date.to_datetime)
    end
  end
end
