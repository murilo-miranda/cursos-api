class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :end_date, null: false

      t.timestamps
    end
  end
end
