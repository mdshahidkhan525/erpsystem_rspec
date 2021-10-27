json.extract! student, :id, :first_name, :last_name, :father_name, :roll_no, :email_id, :student_class, :password, :mobile, :created_at, :updated_at
json.url student_url(student, format: :json)
