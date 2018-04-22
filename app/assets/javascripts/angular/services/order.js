angular.module('onlineShop.services')
.factory('Order',
  ['railsResourceFactory', '$http',
  function (railsResourceFactory, $http) {

  var Order = railsResourceFactory({
    name: 'order'
  });

  Order.sendSummary = function(id) {
    return $http.post("/orders/" + id + "/summary");
  };

  return Order;
}]);