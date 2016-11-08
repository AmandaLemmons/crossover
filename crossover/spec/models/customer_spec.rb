require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
     it { is_expected.to have_db_column(:firstname).of_type(:string) }
     it { is_expected.to have_db_column(:lastname).of_type(:string) }
     it { is_expected.to have_db_column(:email).of_type(:string) }
     it { is_expected.to have_db_column(:password).of_type(:string) }
     it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
     it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
   end

   describe "validations" do
     it { is_expected.to validate_presence_of(:id) }
     it { is_expected.to validate_presence_of(:firstname) }
     it { is_expected.to validate_presence_of(:lastname) }
     it { is_expected.to validate_presence_of(:email) }
     it { is_expected.to validate_presence_of(:password) }

   end
 end
