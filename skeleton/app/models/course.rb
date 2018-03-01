class Course < ApplicationRecord
  has_many :enrollments,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: :Enrollment

  belongs_to :prequesite,
    foreign_key: :prereq_id,
    primary_key: :id,
    class_name: :Course

  belongs_to :instructor,
    foreign_key: :instructor_id,
    primary_key: :id,
    class_name: :User

  has_many :enrolled_students,
    through: :enrollments,
    source: :user
end
