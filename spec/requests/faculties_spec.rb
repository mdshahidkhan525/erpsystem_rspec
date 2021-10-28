require 'rails_helper'

RSpec.describe '/faculties', type: :request do

  describe 'GET /index' do
    it 'renders a successful response' do
      faculty = FactoryBot.create(:faculty)
      get faculties_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      faculty = FactoryBot.create(:faculty)
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
      faculty = FactoryBot.create(:faculty)
      get edit_faculty_url(faculty)
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested post' do
      faculty = FactoryBot.create(:faculty)
      expect do
        delete faculty_url(faculty)
      end.to change(Faculty, :count).by(-1)
    end

    it 'redirects to the posts list' do
      faculty = FactoryBot.create(:faculty)
      delete faculty_url(faculty)
      expect(response).to redirect_to(faculties_url)
    end
  end
end
