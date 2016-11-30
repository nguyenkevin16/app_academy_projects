class User < ActiveRecord::Base
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :taught_courses,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :Course

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
end
