angular.module('onlineShop.services')
.factory('Basket',
  ['railsResourceFactory', '$http',
  function (railsResourceFactory, $http) {

  var Basket = railsResourceFactory({
    url: '/baskets',
    name: 'basket'
  });

  Basket.fetchTotal = function() {
    var url = this.$url('total');
    return $http.get(url);
  };

  Basket.fetchProducts = function() {
    var url = this.$url('products');
    return $http.get(url);
  };

  Basket.updateProduct = function(id, direction) {
    var url = this.$url('update_product');
    return $http.patch(url, { product_id: id, direction: direction });
  };

  return Basket;
}]);