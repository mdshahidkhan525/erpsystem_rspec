require 'rails_helper'

RSpec.describe '/students', type: :request do

  let(:valid_attributes) do
    {
      'id' => '1',
      'first_name' => 'Test',
      'last_name' => 'User',
      'father_name' => 'Mkahn singh',
      'password' => 123456,
      'roll_no' => '0821cs161070',
      'email_id' => 'mdshahidkn524@gmail.com',
      'student_class' => "7th",
      'mobile' => "7474775850"

    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'first_name' => 1 ,
      'roll_no' => '1234'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      student = Student.new(valid_attributes)
      student.save
      get students_url
      expect(response).to be_successful
    end
  end

  # describe 'GET /show' do
  #   it 'renders a successful response' do
  #     student = Student.new(valid_attributes)
  #     student.save
  #     get student_url(student)
  #     expect(response).to be_successful
  #   end
  # end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_student_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      student = Student.new(valid_attributes)
      student.save
      get edit_student_url(student)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
      it 'creates a new Student with valid param' do
        expect do
          student = Student.new(valid_attributes)
          student.save
          post students_url, params: { student: valid_attributes }
        end.to change(Student, :count).by(1)
      end

      it 'does not create a new Student with invalid params' do
        expect do
          post students_url, params: { student: invalid_attributes }
        end.to change(Student, :count).by(0)
      end
  end
  
  describe 'DELETE /destroy' do
    it 'destroys the requested student' do
      student = Student.new(valid_attributes)
      student.save
      expect do
        delete student_url(student)
      end.to change(Student, :count).by(-1)
    end

    it 'redirects to the students list' do
      student = Student.new(valid_attributes)
      student.save
      delete student_url(student)
      expect(response).to redirect_to(students_url)
    end
  end
end

