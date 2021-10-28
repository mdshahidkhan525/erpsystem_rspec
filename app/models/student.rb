class Student < ApplicationRecord
	has_one_attached :studentimage, dependent: :destroy 
	has_one :result, dependent: :destroy

	validates :email_id,:roll_no ,uniqueness: true

	validates :first_name, :last_name ,:father_name, :password, :email_id, :roll_no, :student_class,presence: true

	# after_create :resultcreate, :rpcall                               #uncomment this
	#after student created result will be generate
		def resultcreate
			s = Student.last
			sn = s.roll_no
			sid = s.id
			r= Result.create(:student_roll=>sn,:student_id=>sid)
			r.save
		end

		def rpcall
			a = Admin.last
		    a.result_pub = false
		    a.save
		end
end
