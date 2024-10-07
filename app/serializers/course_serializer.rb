class CourseSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :end_date
end
