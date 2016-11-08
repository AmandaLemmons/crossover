require 'rails_helper'

RSpec.describe AuthenticationToken, type: :model do

  describe "db structure" do
    it { is_expected.to have_db_column(:customer_id).of_type(:integer) }
    it { is_expected.to have_db_column(:body).of_type(:string) }
    it { is_expected.to have_db_column(:ip_address).of_type(:string) }
    it { is_expected.to have_db_column(:customer_agent).of_type(:string) }
    it { is_expected.to have_db_column(:last_used_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { is_expected.to have_db_index(:customer_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:customer) }
  end

end
