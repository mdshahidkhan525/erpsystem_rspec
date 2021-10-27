require 'rails_helper'

RSpec.describe Result, type: :model do

  describe Result, "validation" do
    it { should validate_presence_of(:student_roll) }
  end

  describe Result, "association" do
    it { should belong_to(:student) }
  end

  describe Result, "column-specifications" do
    it { should have_db_column(:student_roll).of_type(:string) }
    it { should have_db_column(:hindi).of_type(:integer) }
    it { should have_db_column(:english).of_type(:integer) }
    it { should have_db_column(:maths).of_type(:integer) }
    it { should have_db_column(:science).of_type(:integer) }
    it { should have_db_column(:social_science).of_type(:integer) }
    it { should have_db_column(:total).of_type(:integer) }
    it { should have_db_column(:obtained_marks).of_type(:integer) }
    it { should have_db_column(:remark).of_type(:string) }
  end
  
end
