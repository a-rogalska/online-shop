var onlineShop = angular.module('onlineShop', ['onlineShop.services'])
.config(["$httpProvider", "$locationProvider", "$provide", function(p, $locationProvider, $provide) {
  var m = document.getElementsByTagName('meta');
  for (var i in m) {
    if (m[i].name == 'csrf-token') {
      p.defaults.headers.common['X-CSRF-Token'] = m[i].content;
      break;
    }
  }
}]);

angular.module('onlineShop.services', ['rails']);