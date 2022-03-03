class User < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course

  belongs_to :instructed_course,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :Course

end
