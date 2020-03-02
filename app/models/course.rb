class Course < ApplicationRecord
    has_many :sections
    has_many :exams
    has_many :discussions
    has_many :exercises
    
    belongs_to :user
end
