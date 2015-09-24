'use strict';

angular.module('webcamApp.controllers.static', [])

.run(function ($rootScope, $templateCache, $staticStorage, $location) {
	
//	$staticStorage.benchmark().drop();
	
	if(!$staticStorage.benchmark().isInit()){
		$staticStorage.benchmark().test();
	}

//	test2();
//	test3();
	
	$rootScope.$on('$routeChangeStart', function(event, next, current) {
		if (typeof current != 'undefined') {
			$templateCache.remove(current.templateUrl);
		}
	});
	
	$rootScope.$on('$routeChangeSuccess', function() {
		if (typeof $rootScope.previousPage2 == 'undefined') {
			$rootScope.previousPage2 = '/';
		}
		if (typeof $rootScope.previousPage == 'undefined') {
			$rootScope.previousPage = '/';
		}
		
		if($rootScope.previousPage2 != $rootScope.previousPage){
			$rootScope.previousPage2 = $rootScope.previousPage;
		}
		
		$rootScope.previousPage = $location.$$path;
	});
	
	$rootScope.$on('$viewContentLoaded', function () {
		$templateCache.removeAll();
		$location.replace();
	});
	
	$rootScope.$on('$destroy', function() {
		for (var key in $rootScope) {
			if (key.substr(0, 1) != '$' && key != 'this')
				delete $rootScope[key];
		}
	});
	
})

.controller('IndexCtrl', ['$scope', '$rootScope', '$location', '$filter', '$timeout', '$staticStorage', '$localStorage', '$templateCache',
function ($scope, $rootScope, $location, $filter, $timeout, $staticStorage, $localStorage, $templateCache) {

	  $scope.lastMonth 		= new Date()
	, $scope.currentMonth 	= new Date()
	, $scope.nextMonth 		= new Date()
	, $scope.lastMonth.setMonth($scope.lastMonth.getMonth() - 1)
	, $scope.nextMonth.setMonth($scope.nextMonth.getMonth() + 1)
	, $scope.modules = new Array()
	, $scope.settings_key = $staticStorage.benchmark().settingsKey()
//	, $scope.clock = "00:00"
//	, $scope.tickInterval = 100
	, $scope.$storage = $localStorage.$default({});
	
	$scope.openTimeLine = function(date) {
		date = $filter('date')(date, 'yyyy-MM-dd');
		$location.path("/timeline").search({ date: date });
		
		if($location.path().indexOf('timeline') > -1){
			$location.search({ date: date });
		}
		
		$("#menu-toggle").click();
	};
	/*
    var tick = function() {
          $scope.clock = Date.now() // get the current time
        , $timeout(tick, $scope.tickInterval); // reset the timer
    };
    
    // Start the timer
    $timeout(tick, $scope.tickInterval);
    $scope.tickInterval = 10000; //ms
	*/
    $scope.isActive = function(route) {
    	return route === $location.path();
    };

    $rootScope.$on("$routeChangeStart", function() {
    	$rootScope.loading = true;
    });

    $rootScope.$on("$routeChangeSuccess", function() {
    	$rootScope.loading = false;
    });
    
    $scope.returnToRoot = function() {
    	$location.path('/');
    	$location.replace();
	};
	
	$scope.localSettings = function(name) {
		$staticStorage.benchmark().changeSettings(name);
	};
    
	$scope.retest = function() {
		$rootScope.loading = true;
		$staticStorage.benchmark().drop();
		
		if(!$staticStorage.benchmark().isInit()){
			var test = $staticStorage.benchmark().test();
			test.then(function(result) {
				$rootScope.loading = false;
			});
		}
	};
	
	$scope.clean = function() {
		$rootScope.loading = true;
		$templateCache.removeAll();
		$location.replace();
		$localStorage.$reset();
		$rootScope.loading = false;
	};
	
	$scope.clearLoading = function(name) {
		delete $scope.templates[name].list.loading;
	};
	
	$scope.initTab = function(name, type) {
		setTimeout($scope.initPage(name, type), 20);
	};
	
	$scope.initPage = function(name, type) {
		if(!$scope.templates[name][type].init){
			$scope.templates[name][type].init = true;
			$templateCache.removeAll();
			$location.replace();
		}
	};
	
	function init() {
	    var timer = setTimeout(function() {
	    	$scope.modules = $staticStorage.modules().data;
	    	$scope.templates = $staticStorage.templates();
	    	clearTimeout(timer);
	    	timer = null;
		}, 10);
	}
	
	init();
	/*
	$scope.$on('$destroy', function() {
		for (var key in $scope) {
			if (key.substr(0, 1) != '$' && key != 'this')
				delete $scope[key];
		}
	});
	*/
}])

.controller('PhotoViewerCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$location', '$route', '$filter', '$modal', '$localStorage', 'toaster', '$timeout',  
function ($scope, $servicesStorage, $staticStorage, $location, $route, $filter, $modal, $localStorage, toaster, $timeout) {

		function variables() {
			  $scope.dataPhoto = new Array()
			, $scope.scrollable = {
					  attemptsNumber: 0
			  		, dataLoading: true
			  		, pageNumber: 1
			  		, pageSize: $staticStorage.benchmark().batchSize()
			}
			, $scope.current = new Object()
			, $scope.speed = 1000
			, $scope.currentPosition = 0
		    , $scope.trackPosition = 0
			, $scope.autoPlay = false
			, $scope.totalFrames = 0
			, $scope.currentFrame = 0
			, $scope.init = false
			, $scope.repeat = false
			, $scope.playing = false;
		};
	    
	    $scope.reloadData = function () {
	    	$scope.scrollable.pageNumber = 1;
	    	$scope.loadDataPhoto(true);
	    };
	    
	    $scope.loadAllDataPhoto = function() {
	    	$servicesStorage.PhotoDao().listView({ initDicts: true, initLists: false }, function (data) {
	    		$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataPhoto = JSOG.decode(data.data);
						$scope.filteredPhoto = $scope.dataPhoto.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataPhoto = $scope.dataPhoto;
						}
					}
					else {
						$scope.scrollable.pageNumber--;
					}
				}
				else {
					toaster.pop('error', data.message);
				}
	    	});
	    };
	    
	    $scope.loadDataPhoto = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.PhotoDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataPhoto = new Array();
	    			$scope.filteredPhoto = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataPhoto = APP.uniqueArray($scope.dataPhoto.concat(JSOG.decode(data.data)));
						$scope.filteredPhoto = $scope.dataPhoto.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataPhoto = $scope.dataPhoto;
						}
						
					}
					else {
						$scope.scrollable.pageNumber--;
					}
				}
				else if(data.warning){
					$scope.stop();
				}
				else {
					toaster.pop('error', data.message);
					$scope.stop();
				}
				
	 		});
		};
		
		$scope.totalCount = function() {
			$servicesStorage.PhotoDao().total({}, function (data) {
				console.info('data: ', data);
				if(data.success){
					$scope.totalFrames = data.data;
				}
			});
		};
	    /*
		$scope.$watch('currentPosition', function() {
			//$scope.timeLine($scope.currentPosition);
		});
		$scope.timeLine = function (value) {
			var index = APP.readPercent2($scope.totalFrames, value);
			console.info('currentPosition: ', value, ', slide#', index);
			$scope.current = $scope.dataPhoto[index];
		};
	     */
		
		$scope.select = function (item) {
//			console.info('item: ', item);
			$scope.current = Object.create(item);
		};
		
		$scope.selectNext = function () {
			var index = $scope.dataPhoto.indexOf($scope.current);
			var max = APP.readPercent($scope.dataPhoto.length, 60);
			
//			console.info('index: ', index, ', max:', max, ', length:', $scope.dataPhoto.length);
			
			if(index == max){
				$scope.loadDataPhoto();
			}
			else if(((index + 1) == $scope.dataPhoto.length) && !$scope.scrollable.dataLoading){
				$scope.stop();
				if($scope.repeat){
					$timeout(function() {
						$scope.playOn();
					}, $scope.speed + $scope.speed);
					
			    }
			}
			
			$scope.current = $scope.dataPhoto[++index];
//			console.info(
//					' max: ', $scope.totalFrames,
//					', index: ', index,
//					', pos: ', APP.readPercent2($scope.totalFrames, index),
//					', pos2: ', APP.readPercent2(index, $scope.totalFrames),
//					', pos3: ', APP.readPercent($scope.totalFrames, index),
//					', pos3: ', APP.readPercent(index, $scope.totalFrames)
//			);
//			console.log('-------------------------');
			$scope.trackPosition = APP.readPercent2(++$scope.currentFrame, $scope.totalFrames);
			$scope.currentPosition = $scope.trackPosition;
			
//			$scope.currentPosition = APP.readPercent2(index, $scope.totalFrames); 
		};
		
		$scope.playOn = function () {
			$scope.init = true;
			$scope.autoPlay = true;
			if(!$scope.playing){
				$scope.play();
			}
			$scope.playing = true;
		};
		
		$scope.pause = function () {
			$scope.autoPlay = false;
			$scope.playing = false;
		};
		
		$scope.stop = function () {
			$scope.autoPlay = false;
			$scope.playing = false;
			$scope.currentFrame = 0;
			$scope.currentPosition = 0;
		    $scope.trackPosition = 0;
		    $scope.current = null;
		    $scope.current = new Object();
		    $scope.totalCount();
		};
		
		$scope.play = function () {
//			console.info(': ', 'play');
			$scope.selectNext();
			
			$timeout(function() {
				if($scope.autoPlay){
					$scope.play();
				}
			}, $scope.speed);
		};
		
		function init() {
		    var timer = setTimeout(function() {
		    	$scope.totalCount();
	    		$scope.loadDataPhoto(true);
		    	clearTimeout(timer);
		    	timer = null;
		    	console.info('percent: 10 of 255', APP.readPercent2(10, 255));
			}, APP.timeOutCount("Photo", $staticStorage));
		};
		
		variables();
		init();
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
}])

.controller('RuserCtrl', ['$scope',   
function ($scope) {
	
}])


.controller('UploadImageCtrl', ['$scope', 'FileUploader', '$modalInstance', 
function($scope, FileUploader, $modalInstance) {
	
	  $scope.loading = false
	, $scope.list = [];
	  
	var uploader = $scope.uploader = new FileUploader({
		url: '../image/upload'
	});
	
	uploader.filters.push({
		name: 'imageFilter',
		fn: function(item /*{File|FileLikeObject}*/, options) {
			var type = '|' + item.type.slice(item.type.lastIndexOf('/') + 1) + '|';
			return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
		}
	});
	
	uploader.onSuccessItem = function(fileItem, response, status, headers) {
		if(response.success && response.data.length > 0){
			$scope.list.push(response.data[0]);
		}
	};

	uploader.onCompleteAll = function() {
		$modalInstance.close({
			data: $scope.list
		});
	};
	
	$scope.submitFunc = function () {
		$scope.loading = true;
		$scope.uploader.uploadAll();
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
	
}])

.controller('UploadDocumentCtrl', ['$scope', 'FileUploader', '$modalInstance', 'toaster', 
function($scope, FileUploader, $modalInstance, toaster) {
	
	  $scope.loading = false
	, $scope.uploading = false
	, $scope.list = [];
	
	var uploader = $scope.uploader = new FileUploader({
		url: '../document/upload'
	});
	
	uploader.filters.push({
         name: 'customFilter',
         fn: function(item, options) {
             return this.queue.length < 10;
         }
    });
	
	uploader.onSuccessItem = function(fileItem, response, status, headers) {
		if(response.success){
			$scope.list.push(response.data);
		}
		else {
			toaster.pop('error', response.message);
		}
	};
	
	uploader.onCompleteAll = function() {
		$modalInstance.close({
			data: $scope.list
		});
	};
	
	$scope.submitFunc = function () {
		$scope.loading = true;
		$scope.uploading = true;
		$scope.uploader.uploadAll();
	};
	
	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
	
}])

.controller('LogsListCtrl', ['$scope', 'LogsServiceList', '$location', '$route', 
function ($scope, LogsServiceList, $location, $route) {
	
	  $scope.searchKeyword = ""
	, $scope.data = []
	, $scope.headers = []
	, $scope.currentPage = 1
	, $scope.numPerPage = 100;
	
	$scope.editItem = function (itemId) {

	};
	
	$scope.createNewItem = function () {

	};
	
	$scope.reloadData = function () {
		$route.reload();
	};
	
	$scope.checkForNull = function () {
		$scope.access = true;
		
		if($scope.total != null && $scope.total <= 0){
			$scope.emptymsg = "No data for representation";
			$scope.access = false;
		}
		
		if($scope.msg != null){
			$scope.emptymsg = $scope.msg;
			$scope.access = false;
		}
		
		return $scope.access;
	};
	
	LogsServiceList.list({}, function (data) {
		$scope.msg = data.message; 
		$scope.total = data.total; 
		$scope.data = data.data; 
		$scope.headers = data.headers;
		$scope.filteredLogs = $scope.data.slice(0, $scope.numPerPage);
		$scope.totalItems = Math.round($scope.data.length / $scope.numPerPage);

	});
	  
	$scope.pageChanged = function() {
		var begin = (($scope.currentPage - 1) * $scope.numPerPage)
	    , end = begin + $scope.numPerPage;
	    
	    $scope.filteredLogs = $scope.data.slice(begin, end);
	};
}])
/*
.controller('SearchCtrl', ['$scope', '$rootScope', '$location',
function ($scope, $rootScope, $location) {
	
	$scope.person = {};
	$scope.person.selected = {};
	$scope.people = [
			{ name: 'Adam',      email: 'adam@email.com',      age: 10 },
			{ name: 'Amalie',    email: 'amalie@email.com',    age: 12 },
			{ name: 'Wladimir',  email: 'wladimir@email.com',  age: 30 },
			{ name: 'Samantha',  email: 'samantha@email.com',  age: 31 },
			{ name: 'Estefanía', email: 'estefanía@email.com', age: 16 },
			{ name: 'Natasha',   email: 'natasha@email.com',   age: 54 },
			{ name: 'Nicole',    email: 'nicole@email.com',    age: 43 },
			{ name: 'Adrian',    email: 'adrian@email.com',    age: 21 }
	];
	
}]);
*/
.controller('LocalizationListCtrl', ['$scope', 'LocalizationServiceList', '$location', '$route', 'toaster',
function ($scope, LocalizationServiceList, $location, $route, toaster) {
	
	  $scope.searchKeyword = ""
	, $scope.data = []
	, $scope.currentPage = 1
	, $scope.numPerPage = 50;
	
	$scope.sync = function () {
		LocalizationServiceList.createItem($scope.data, function (data) {
			if (data.success) {
				toaster.pop('success', "Localization", JSON.stringify(data));
			}
			else {
				toaster.pop('danger', "Localization", JSON.stringify(data));
			}
		});
	};
	
	$scope.reloadData = function () {
		$route.reload();
	};
	
	$scope.checkForNull = function () {
		$scope.access = true;
		
		if($scope.total != null && $scope.total <= 0){
			$scope.emptymsg = "No data for representation";
				$scope.access = false;
			}
			
			if($scope.msg != null){
				$scope.emptymsg = $scope.msg;
				$scope.access = false;
			}
			
			return $scope.access;
		};
		
		LocalizationServiceList.list({}, function (data) {
			$scope.msg = data.message; 
			$scope.total = data.total; 
			$scope.data = data.data; 
			$scope.filteredData = $scope.data.slice(0, $scope.numPerPage);
			$scope.totalItems = Math.round($scope.data.length / $scope.numPerPage);
			$scope.headers = data.headers;
		});
		
		$scope.pageChanged = function() {
			var begin = (($scope.currentPage - 1) * $scope.numPerPage)
			, end = begin + $scope.numPerPage;
			
			$scope.filteredData = $scope.data.slice(begin, end);
		};
}]);
