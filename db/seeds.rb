
Product.destroy_all

Product.create([
  {
    product_code: "FR1",
    name: "Fruit tea",
    price: 3.11
  },
  {
    product_code: "AP1",
    name: "Apple",
    price: 5.00
  },
  {
    product_code: "CF1",
    name: "Coffee",
    price: 11.23
  }
])

p "Created #{Product.count} products"
