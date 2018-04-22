onlineShop.controller('OrderCtrl', ['$scope', 'Order',
  function OrderCtrl($scope, Order) {
    $scope.alerts = [];

    $scope.sendSummary = function(order_id) {

      var resolved = function(response) {
        $scope.alerts.push({msg: "Email was sent", type: "success" });
        console.log("email was sended");
      };

      var rejected = function(response) {
        console.log("sending email error");
      };

      return Order.sendSummary(order_id).then(resolved, rejected);
    };

    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };
}]);