require 'rails_helper'

describe Product do
  let(:product) { create(:product) }

  it "has valid factory" do
    expect(build(:product)).to be_valid
  end

  context "validations" do
    it { expect(product).to validate_presence_of(:product_code) }
    it { expect(product).to validate_presence_of(:name) }
    it { expect(product).to validate_presence_of(:price) }
  end

  context "columns" do
    it { expect(product).to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { expect(product).to have_db_column(:product_code).of_type(:string).with_options(null: false) }
    it { expect(product).to have_db_column(:price).of_type(:decimal).with_options(null: false, default: 0.0) }
  end
end