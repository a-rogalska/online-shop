require 'rails_helper'

describe DiscountCalculator do
  let(:product) { create :product }

  shared_examples "calculating discount" do |type|
    let(:type) { type }
    let(:basket) {{ products: {}, total: {} }}

    before do
      basket[:total] = Basket::Total.new(0,0)
    end

    context "without products" do
      it "doesn't change total price" do
        expect {
          described_class.new(basket, product.product_code).send(type)
        }.to_not change {
          basket[:total][:total_price]
        }
      end
    end

    context "with products" do
      before :each do
        basket[:products]["#{product.id}"] = 3
        basket[:total] = Basket::Total.new(3, 3 * product.price)
      end

      it "changes total price" do
        expect {
          described_class.new(basket, product.product_code).send(type)
        }.to change {
          basket[:total][:total_price]
        }.by(-discount)
      end

      it "adds discount" do
        expect {
          described_class.new(basket, product.product_code).send(type)
        }.to change {
          basket[:total][:discount]
        }.by(discount)
      end
    end
  end

  context "when bulk discount" do
    it_behaves_like "calculating discount", :bulk_discount do
      let(:discount) { 4.5 }
    end
  end

  context "when one to one discount" do
    it_behaves_like "calculating discount", :one_to_one_discount do
      let(:discount) { product.price }
    end
  end
end