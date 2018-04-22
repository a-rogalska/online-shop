onlineShop.controller('BasketCtrl', ['$scope', 'Basket',
  function BasketCtrl($scope, Basket) {

    this.$onInit = function() {
      $scope.fetchTotal();
    };

    $scope.fetchTotal = function() {
      $scope.basketLoading = true;

      var resolved = function(response) {
        $scope.basketTotal = response.data.total;
      };

      var rejected = function(response) {
        console.log("fetching basket error");
      };

      return Basket.fetchTotal().then(resolved, rejected).finally(function(){
        $scope.basketLoading = false;
      });
    };

    $scope.fetchProducts = function() {

      var resolved = function(response) {
        $scope.products = response.data;
      };

      var rejected = function(response) {
        console.log("fetching products error");
      };

      return Basket.fetchProducts().then(resolved, rejected);
    };

    $scope.updateBasket = function(id, direction) {

      var resolved = function(response) {
        $scope.basket = response.data.products;
        $scope.fetchTotal();
      };

      var rejected = function(response) {
        console.log("error updating basket");
      };

      return Basket.updateProduct(id, direction).then(resolved, rejected);
    };
}]);