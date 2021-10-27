require 'rails_helper'

RSpec.describe Admin, type: :model do

  describe "column specification" do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:result_pub).of_type(:boolean) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
  end
  
end
