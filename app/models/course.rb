class Course < ApplicationRecord
  scope :active_date, -> { where("end_date >= ?", Date.today) }
end
