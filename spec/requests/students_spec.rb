require 'rails_helper'

RSpec.describe '/students', type: :request do

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'first_name' => 1 ,
      'roll_no' => '1234'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      student = FactoryBot.create(:student)
      get students_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      student = FactoryBot.create(:student)
      get student_url(student)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_student_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      student = FactoryBot.create(:student)
      get edit_student_url(student)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
      it 'creates a new Student with valid param' do
        expect do
          student = FactoryBot.create(:student)
          post students_url, params: { student: student }
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
      student = FactoryBot.create(:student)
      expect do
        delete student_url(student)
      end.to change(Student, :count).by(-1)
    end

    it 'redirects to the students list' do
      student = FactoryBot.create(:student)
      delete student_url(student)
      expect(response).to redirect_to(students_url)
    end
  end
end

