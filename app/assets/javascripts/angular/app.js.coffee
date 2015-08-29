app = angular.module('test', [])

Url = ($http, $q)->

  create = (data)->
    deferred = $q.defer()
    $http.post('/api/urls', data).success (request)->
      deferred.resolve(request)
    .error (request)->
      console.log(request)
    deferred.promise

  query = ->
    deferred = $q.defer()
    $http.get('/api/urls').success (request)->
      deferred.resolve(request)
    .error (request)->
      console.log(request)
    deferred.promise
  {
    query: query,
    create: create
  }


Url.$inject = ['$http', '$q']

app.factory 'Url', Url