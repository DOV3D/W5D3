class Course < ApplicationRecord
    has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

    has_many :enrolled_students,
    through: :enrollments,
    source: :user

    belongs_to :prerequisites,
    primary_key: :id,
    foreign_key: :prereq_id, 
    class_name: :Course

    has_many :instructor,
    primary_key: instructor_id
    through: :enrollments,
    source: :user

    

end