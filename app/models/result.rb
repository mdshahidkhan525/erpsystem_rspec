class Result < ApplicationRecord
  belongs_to :student
  
  validates :student_roll ,uniqueness: true
  validates :student_roll ,presence: true
end
