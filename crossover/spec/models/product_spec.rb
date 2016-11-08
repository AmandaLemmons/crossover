require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "db structure" do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
     it { is_expected.to have_db_column(:description).of_type(:string) }
     it { is_expected.to have_db_column(:name).of_type(:string) }
     it { is_expected.to have_db_column(:price).of_type(:decimal) }
     it { is_expected.to have_db_column(:status).of_type(:integer) }
     it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
     it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
   end

   describe "validations" do
     it { is_expected.to validate_presence_of(:id) }
     it { is_expected.to validate_presence_of(:description) }
     it { is_expected.to validate_presence_of(:price) }
     it { is_expected.to validate_presence_of(:status) }
     it { is_expected.to validate_presence_of(:name) }

   end
 end
