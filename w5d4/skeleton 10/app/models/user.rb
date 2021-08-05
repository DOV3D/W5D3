class User < ApplicationRecord
    has_many: :enrollments, 
    primary_key: :id,
    foreign_key: :student_id, 
    class_name: :Enrollment 
end
