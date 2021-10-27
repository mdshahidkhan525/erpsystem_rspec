class Faculty < ApplicationRecord
	validates :email, presence: true, length: { minimum: 4 }
	validates :password, presence: true, length: { in: 5..10 }
	validates :first_name, presence: true
	validates :email ,uniqueness: true
end
