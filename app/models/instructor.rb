class Instructor < ApplicationRecord
    has_many :students

    def average_student_age
        if students.count != 0
            students.sum {|student| student.age} / students.count
        else
            0
        end
    end

    def students_sort_by_name
        students.sort_by {|student| student.name}
    end
end
