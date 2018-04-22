require 'rails_helper'

describe Basket::UpdateService do
  let(:basket) {{ products: {}, total: {} }}
  let(:product) { create :product }

  context "adding product" do
    let(:direction) { "add" }

    context "when product wasn't in busket" do
      before do
        described_class.call(basket, product.id, direction)
      end

      it "changes product count" do
        expect(basket[:products]["#{product.id}"]).to eq 1
      end
    end

    context "when product was in busket" do
      before do
        basket[:products]["#{product.id}"] = 3
      end

      it "adds product" do
        expect {
          described_class.call(basket, product.id, direction)
        }.to change {
          basket[:products]["#{product.id}"]
        }.by(1)
      end
    end
  end

  context "removing product" do
    let(:direction) { "remove" }

    context "when product wasn't in busket" do
      it "doesn't changes product count" do
        expect {
          described_class.call(basket, product.id, direction)
        }.to_not change {
          basket[:products]
        }
      end
    end

    context "when product was in busket" do
      before do
        basket[:products]["#{product.id}"] = 3
      end

      it "removes product" do
        expect {
          described_class.call(basket, product.id, direction)
        }.to change {
          basket[:products]["#{product.id}"]
        }.by(-1)
      end
    end
  end

end