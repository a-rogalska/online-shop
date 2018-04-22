require 'rails_helper'

describe ProductOrder do
  let(:product_order) { create(:product_order) }

  it "has valid factory" do
    expect(build(:product_order)).to be_valid
  end

  context "associations" do
    it { should belong_to(:product) }
    it { should belong_to(:order) }
  end

  context "validations" do
    it { expect(product_order).to validate_presence_of(:count) }
  end

  context "columns" do
    it { expect(product_order).to have_db_column(:product_id).of_type(:integer) }
    it { expect(product_order).to have_db_column(:order_id).of_type(:integer) }
    it { expect(product_order).to have_db_column(:count).of_type(:integer).with_options(null: false, default: 0) }
  end

  context "indexes" do
    it { expect(product_order).to have_db_index(:product_id) }
    it { expect(product_order).to have_db_index(:order_id) }
  end
end