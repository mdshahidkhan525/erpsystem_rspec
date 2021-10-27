require 'rails_helper'

RSpec.describe Faculty, type: :model do

  describe Faculty, "validation" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:first_name) }
  end
  
  describe Faculty, "column-specification" do
    it { should have_db_column(:first_name).of_type(:string)}
    it { should have_db_column(:last_name).of_type(:string)}
    it { should have_db_column(:email).of_type(:string)}
    it { should have_db_column(:subject).of_type(:string)}
    it { should have_db_column(:subject_code).of_type(:string)}
    it { should have_db_column(:password).of_type(:string)}
    it { should have_db_column(:faculty_id).of_type(:integer)}
  end
  
end
