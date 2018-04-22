require 'rails_helper'

describe Order do
  let(:order) { create(:order) }

  it "has valid factory" do
    expect(build(:order)).to be_valid
  end

  context "validations" do
    it { expect(order).to validate_presence_of(:first_name) }
    it { expect(order).to validate_presence_of(:last_name) }
    it { expect(order).to validate_presence_of(:email) }
    it { expect(order).to validate_presence_of(:address) }
  end

  context "columns" do
    it { expect(order).to have_db_column(:first_name).of_type(:string).with_options(null: false) }
    it { expect(order).to have_db_column(:last_name).of_type(:string).with_options(null: false) }
    it { expect(order).to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { expect(order).to have_db_column(:address).of_type(:string).with_options(null: false) }
    it { expect(order).to have_db_column(:total).of_type(:decimal).with_options(null: false, default: 0.0) }
    it { expect(order).to have_db_column(:discount).of_type(:decimal).with_options(null: false, default: 0.0) }
  end
end