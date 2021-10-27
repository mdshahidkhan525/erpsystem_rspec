require 'rails_helper'

RSpec.describe Student, type: :model do

  describe Student,'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:father_name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email_id) }
    it { should validate_presence_of(:roll_no) }
    it { should validate_presence_of(:student_class) }
    it { should validate_uniqueness_of(:roll_no) }
    it { should validate_uniqueness_of(:email_id) }
  end

  describe Student,'association' do
      it { should have_one(:result) }
  end
  
  describe Student,'column_specification' do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:father_name).of_type(:string) }
    it { should have_db_column(:password).of_type(:string) }
    it { should have_db_column(:email_id).of_type(:string) }
    it { should have_db_column(:roll_no).of_type(:string) }
    it { should have_db_column(:student_class).of_type(:string) }
    it { should have_db_column(:mobile).of_type(:string) }
  end
  
  describe Student,"callbacks" do
    it { is_expected.to callback(:resultcreate).after(:create) } 
    it { is_expected.to callback(:rpcall).after(:create) } 
  end
  
end
