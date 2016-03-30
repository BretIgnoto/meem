var app = angular.module('meems', ['ngRoute']);
app.config(function($routeProvider) {
    $routeProvider
        .when("/silver", {
            templateUrl: "/partials/silver.html",
        })
        .when("/gold", {
            templateUrl: "/partials/gold.html",
        })
        .when("/platinum", {
            templateUrl: "/partials/platinum.html",
        })
})