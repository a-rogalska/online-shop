require 'rails_helper'

describe Basket::Calculations do
  let(:products) { create_list :product, 2 }
  let(:basket) {{ products: {}, total: {} }}

  context "with products" do
    before do
      products.each do |product|
        basket[:products]["#{product.id}"] = 3
      end
      described_class.call(basket)
    end

    it "calculates products count" do
      expect(basket[:total][:count]).to eq 6
    end

    it "calculates total price without discount" do
      total = (3 * products.first.price) + (3 * products.last.price)
      expect(basket[:total][:total_price]).to eq total
    end
  end

  context "without products" do
    before do
      described_class.call(basket)
    end

    it "calculates products count" do
      expect(basket[:total][:count]).to eq 0
    end

    it "calculates total price without discount" do
      expect(basket[:total][:total_price]).to eq 0
    end
  end
end