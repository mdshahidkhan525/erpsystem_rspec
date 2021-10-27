json.extract! faculty, :id, :first_name, :last_name, :email, :mobile, :subject, :subject_code, :created_at, :updated_at
json.url faculty_url(faculty, format: :json)
