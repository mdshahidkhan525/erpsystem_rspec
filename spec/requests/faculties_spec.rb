require 'rails_helper'

RSpec.describe '/faculties', type: :request do

  let(:valid_attributes) do
    {
      'first_name' => 'user1',
      'email' => 'abc@email.com',
      'password' => '123456'
    }
  end

  let(:invalid_attributes) do
    {
      'email' => 'a@b.c',
      'password' => '16'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      faculty = Faculty.new(valid_attributes)
      faculty.save
      get faculties_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      faculty = Faculty.new(valid_attributes)
      faculty.save
      get faculty_url(faculty)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_faculty_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      faculty = Faculty.new(valid_attributes)
      faculty.save
      get edit_faculty_url(faculty)
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested post' do
      faculty = Faculty.new(valid_attributes)
      faculty.save
      expect do
        delete faculty_url(faculty)
      end.to change(Faculty, :count).by(-1)
    end

    it 'redirects to the posts list' do
      faculty = Faculty.new(valid_attributes)
      faculty.save
      delete faculty_url(faculty)
      expect(response).to redirect_to(faculties_url)
    end
  end
end
