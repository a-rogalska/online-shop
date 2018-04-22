class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :count, :price

  def count
    basket[:products]["#{object.id}"]
  end

  private

  def basket
    instance_options[:basket]
  end
end
