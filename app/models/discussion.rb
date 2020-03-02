class Discussion < ApplicationRecord
    belongs_to :course
    has_many :comments
    belongs_to :user
end
