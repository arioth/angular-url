URL_REGEX = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/

TestController = ($http, $interval, $scope, $window, Url)->
  $scope.resources = $window.gon.urls

  $scope.submit = ->
    test_regex = URL_REGEX.exec($scope.inputUrl)
    if test_regex
      $scope.resources.unshift({
        url: "#{test_regex[2]}.#{test_regex[3]}",
        created_at: Date.now()
      })
      $scope.error = false
      $scope.inputUrl = ''
    else
      $scope.error = true

  $interval ->
    console.log('Sync...')
    notSaveResources = $scope.resources.filter (resource)->
      !resource.id
    $.each notSaveResources, (index, value)->
      Url.create(value).then (data)->
        index = $.inArray(value, $scope.resources)
        $scope.resources[index] = data
  , 15000

TestController.$inject = ['$http', '$interval', '$scope', '$window', 'Url']
angular.module('test').controller 'TestController', TestController