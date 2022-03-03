class Course < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :student

  belongs_to :high_levels,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  has_many :pre_requisites,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  has_many :instructors,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User

end