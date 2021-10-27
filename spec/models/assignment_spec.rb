require 'rails_helper'

RSpec.describe Assignment, type: :model do

  describe Assignment, "column-specifications" do
    it { should have_db_column(:student_roll).of_type(:string) }
    it { should have_db_column(:hindi).of_type(:text) }
    it { should have_db_column(:english).of_type(:text) }
    it { should have_db_column(:maths).of_type(:text) }
    it { should have_db_column(:science).of_type(:text) }
    it { should have_db_column(:social_science).of_type(:text) }
    it { should have_db_column(:no).of_type(:integer) }
  end
  
end
