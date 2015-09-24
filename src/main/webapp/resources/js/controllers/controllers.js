'use strict';

angular.module('webcamApp.controllers', [])

.controller('PhotoListCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$location', '$route', '$filter', '$modal', '$localStorage', 'toaster',  
function ($scope, $servicesStorage, $staticStorage, $location, $route, $filter, $modal, $localStorage, toaster) {

		function variables() {
			  $scope.dataPhoto = new Array()
			, $scope.ctrl = {
					  name: 'PhotoListCtrl'
					, original: 'Photo'  
			}  
			, $scope.scrollable = {
					  attemptsNumber: 0
			  		, dataLoading: true
			  		, pageNumber: 1
			  		, pageSize: $staticStorage.benchmark().batchSize()
			}
			, $scope.selectedItem = new Object()
			, $scope.selectedItems = new Array()
			, $scope.excludes = [ 'photo' ]
			, $scope.details = new Object() 
			, $scope.debug = APP.debugInfo('PhotoListCtrl');
			
			if($staticStorage.benchmark().isCacheble()){
				$scope.$storage = $localStorage.$default({
						dataPhoto: new Array()
			  	})
			  	, $scope.dataPhoto = $scope.$storage.dataPhoto;
			}
			
			APP.defaultListCtrl($scope, $filter);
		};
		
		$scope.createModalNewItem = function () {
			if($staticStorage.benchmark().isModal()){
				var modalInstance = $modal.open({
					templateUrl: 'PhotoEdit',
					controller: 'PhotoEditCtrl',
					backdrop: 'static', 
					resolve: {
						modalSettings: function () { 
							return { 
								  item: $scope.selectedItem
								, mode: "create"
								, isModal: true
								, isSimple: false
								, editItem: new Object()
								, editItemId: -1
								, excludeList: [ 'photo' ]
							}; 
						}
					}
				});
				
				modalInstance.result.then(function (data) {
					$servicesStorage.PhotoDao().showView({ id: data.item.id, initDicts: true, initLists: false }, function (response) {
						if(response.success){
							$scope.dataPhoto.unshift(JSOG.decode(response.data));
						}
						else {
							toaster.pop('error', response.message);
						}
					});
				
				}, function(){});
			}
			else {
				$location.path('/PhotoCreate');
			}
		};

		$scope.editModalItem = function (itemId) {
			if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
		
			if(!$scope.isDisabledEdit()){
				if($staticStorage.benchmark().isModal()){
					var modalInstance = $modal.open({
						templateUrl: 'PhotoEdit/' + itemId,
						controller: 'PhotoEditCtrl',
						backdrop: 'static', 
						resolve: {
							modalSettings: function () { 
								return { 
									  item: $scope.selectedItem
									, mode: "edit"
									, isModal: true
									, isSimple: false
									, editItem: $scope.selectedItem
									, editItemId: itemId
									, excludeList: [ 'photo' ]
									, index: APP.loadIndex($scope.selectedItem.id, $scope.dataPhoto)
								}; 
							}
						}
					});
		
				    modalInstance.result.then(function(data){
				    	$servicesStorage.PhotoDao().showView({ id: data.item.id, initDicts: true, initLists: true }, function (response) {
				    		$scope.dataPhoto[data.index] = JSOG.decode(response.data);
							$scope.selectedItem = $scope.dataPhoto[data.index];
						});
				    }, function(){
				    	
				    });
			    }
			    else {
			    	$location.path('/PhotoEdit/' + itemId);
			    }
		    }
		};
	
	    $scope.deleteItem = function (itemId, index) {
	    	if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
			
	    	if(typeof index == 'undefined'){
	    		index = APP.loadIndex(itemId, $scope.dataPhoto); 
			}
			
			
	    	if(!$scope.isDisabledEdit()){
				$scope.dataPhoto.splice(index, 1);
				$scope.filteredPhoto = $scope.dataPhoto.slice(0);
				
			    $servicesStorage.PhotoDao().remove({ id: itemId }, new Object(), function(response){
			    	
			    });
		    }
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
				else {
					toaster.pop('error', data.message);
				}
				
	 		});
		};
	    
		$scope.setSelectedItem = function (item) {
			$scope.selectedItem = APP.loadItem(item.id, $scope.selectedItems);
			
			if(JSON.stringify($scope.selectedItem) === '{}') { 
				$servicesStorage.PhotoDao().showView({ id: item.id, initDicts: true , initLists: true }, function (data) {
					$scope.selectedItem = JSOG.decode(data.data);
					$scope.selectedItems.push($scope.selectedItem);
				});
			}
			
			return $scope.selectedItem;
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataPhoto(true);
		    	clearTimeout(timer);
		    	timer = null;
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
.controller('PhotoSelectorCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$modalInstance', '$localStorage', '$q', 'toaster',
function ($scope, $servicesStorage, $staticStorage, $modalInstance, $localStorage, $q, toaster) {

		  $scope.dataPhoto = new Array()
		, $scope.ctrl = {
				  name: 'PhotoSelectorCtrl'
				, original: 'Photo'  
		}
		, $scope.scrollable = {
				  attemptsNumber: 0
		  		, dataLoading: true
		  		, pageNumber: 1
		  		, pageSize: $staticStorage.benchmark().batchSize()
		}
		, $scope.selectedItems = new Array()
		, $scope.loading = true
		, $scope.debug = APP.debugInfo('PhotoSelectorCtrl');
		
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					dataPhoto: new Object()
		  	})
		  	, $scope.dataPhoto = $scope.$storage.dataPhoto;
	  	}

		APP.defaultSelectorCtrl($scope, $modalInstance, $servicesStorage, $staticStorage, $q, toaster);
		
		$scope.loadDataPhoto = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.PhotoDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataPhoto = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				$scope.loading = false;
				
				if(data.success){
					if (data.total > 0) {
						$scope.dataPhoto = APP.uniqueArray($scope.dataPhoto.concat(JSOG.decode(data.data)));
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataPhoto = $scope.dataPhoto;
						}
					}
				}
				else {
					$scope.scrollable.pageNumber--;
					toaster.pop('error', data.message);
				}
	 		});
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataPhoto(true);
				clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("Photo", $staticStorage));
		};
		
		init();
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
}])
.controller('PhotoEditCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$modal', '$modalInstance', 'modalSettings', '$servicesStorage', '$filter', '$localStorage', '$staticStorage', 'toaster', '$q', 'APP_INFO', 
function ($scope, $rootScope, $routeParams, $location, $modal, $modalInstance, modalSettings, $servicesStorage, $filter, $localStorage, $staticStorage, toaster, $q, APP_INFO) {
	
		  $scope.item = new Object()
		, $scope.ctrl = {
			  name: 'PhotoEditCtrl'
			, original: 'Photo'  
		}
		, $scope.itemId = -1
		, $scope.itemIndex = -1
		, $scope.loading = true
		, $scope.access = {
			    edit: false
			  , editsimple: false
			  , create: false
			  , createsimple: false
		}
		, $scope.scrollable = {
				  id: modalSettings.editItemId == -1 ? $routeParams.id : modalSettings.editItemId
				, initDicts: true 
				, initLists: true
		}
		, $scope.selectedItem = new Object()
		, $scope.details = new Object()
		, $scope.debug = APP.debugInfo('PhotoEditCtrl');
		//, $scope.tinymceOptions = APP.loadtinymceOption();
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					itemPhoto: new Object()
		  	});
		}
		
		APP.defaultEditCtrl($scope, $modal, $modalInstance, modalSettings, $servicesStorage, $staticStorage, 'Photo', $filter, $location, $rootScope, toaster, APP_INFO);
		
		$scope.updateItem = function () {
			$scope.loading = true;
			var identity = $scope.item.id
			,	item = JSOG.stringify($scope.item);
			
			if(APP_INFO.debug){
				console.info('$scope.updateItem#item: ', $scope.item);
			}
			
			if($scope.access.edit || $scope.access.editsimple){
				$servicesStorage.PhotoDao().update({id: identity}, item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/PhotoList');
					}
				});
			}
			else if($scope.access.create || $scope.access.createsimple){
				$servicesStorage.PhotoDao().create(item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/PhotoList');
					}
				});
			}
			
		};
	
		/*---------------------------*/
		
		function init(callback) {
		
			if(callback){
				callback();
			}
		
			var timer = setTimeout(function() {
				$scope.loading = APP.checkItem($scope.item, modalSettings);
			
				if($scope.access.edit || $scope.access.editsimple){
					$servicesStorage.PhotoDao().showObj($scope.scrollable, function (data) {
						$scope.item = JSOG.decode(data.data);
						if($staticStorage.benchmark().isCacheble()){ 
							$scope.$storage.itemPhoto = data.data;
						} 
						$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
						
						APP.afterLoadingDataEditCtrl($scope, $staticStorage, 'Photo');
					});
				}
				else {
					$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
				}
			

		
				clearTimeout(timer);
		    	timer = null;
		
			}, APP.timeOutCount("Photo", $staticStorage));
		};
		
		init(function() {
			APP.beforeLoadingDataEditCtrl($scope, $staticStorage, modalSettings, 'Photo');
		});
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
		/*---------------------------*/


		/*---------------------------*/
		

		/*---------------------------*/
		

		
}])

/*===========================*/

.controller('RelUserSettingsListCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$location', '$route', '$filter', '$modal', '$localStorage', 'toaster',  
function ($scope, $servicesStorage, $staticStorage, $location, $route, $filter, $modal, $localStorage, toaster) {

		function variables() {
			  $scope.dataRelUserSettings = new Array()
			, $scope.ctrl = {
					  name: 'RelUserSettingsListCtrl'
					, original: 'RelUserSettings'  
			}  
			, $scope.scrollable = {
					  attemptsNumber: 0
			  		, dataLoading: true
			  		, pageNumber: 1
			  		, pageSize: $staticStorage.benchmark().batchSize()
			}
			, $scope.selectedItem = new Object()
			, $scope.selectedItems = new Array()
			, $scope.excludes = [ 'relusersettings' ]
			, $scope.details = new Object() 
			, $scope.debug = APP.debugInfo('RelUserSettingsListCtrl');
			
			if($staticStorage.benchmark().isCacheble()){
				$scope.$storage = $localStorage.$default({
						dataRelUserSettings: new Array()
			  	})
			  	, $scope.dataRelUserSettings = $scope.$storage.dataRelUserSettings;
			}
			
			APP.defaultListCtrl($scope, $filter);
		};
		
		$scope.createModalNewItem = function () {
			if($staticStorage.benchmark().isModal()){
				var modalInstance = $modal.open({
					templateUrl: 'RelusersettingsEdit',
					controller: 'RelUserSettingsEditCtrl',
					backdrop: 'static', 
					resolve: {
						modalSettings: function () { 
							return { 
								  item: $scope.selectedItem
								, mode: "create"
								, isModal: true
								, isSimple: false
								, editItem: new Object()
								, editItemId: -1
								, excludeList: [ 'relusersettings' ]
							}; 
						}
					}
				});
				
				modalInstance.result.then(function (data) {
					$servicesStorage.RelUserSettingsDao().showView({ id: data.item.id, initDicts: true, initLists: false }, function (response) {
						if(response.success){
							$scope.dataRelUserSettings.unshift(JSOG.decode(response.data));
						}
						else {
							toaster.pop('error', response.message);
						}
					});
				
				}, function(){});
			}
			else {
				$location.path('/RelusersettingsCreate');
			}
		};

		$scope.editModalItem = function (itemId) {
			if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
		
			if(!$scope.isDisabledEdit()){
				if($staticStorage.benchmark().isModal()){
					var modalInstance = $modal.open({
						templateUrl: 'RelusersettingsEdit/' + itemId,
						controller: 'RelUserSettingsEditCtrl',
						backdrop: 'static', 
						resolve: {
							modalSettings: function () { 
								return { 
									  item: $scope.selectedItem
									, mode: "edit"
									, isModal: true
									, isSimple: false
									, editItem: $scope.selectedItem
									, editItemId: itemId
									, excludeList: [ 'relusersettings' ]
									, index: APP.loadIndex($scope.selectedItem.id, $scope.dataRelUserSettings)
								}; 
							}
						}
					});
		
				    modalInstance.result.then(function(data){
				    	$servicesStorage.RelUserSettingsDao().showView({ id: data.item.id, initDicts: true, initLists: true }, function (response) {
				    		$scope.dataRelUserSettings[data.index] = JSOG.decode(response.data);
							$scope.selectedItem = $scope.dataRelUserSettings[data.index];
						});
				    }, function(){
				    	
				    });
			    }
			    else {
			    	$location.path('/RelusersettingsEdit/' + itemId);
			    }
		    }
		};
	
	    $scope.deleteItem = function (itemId, index) {
	    	if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
			
	    	if(typeof index == 'undefined'){
	    		index = APP.loadIndex(itemId, $scope.dataRelUserSettings); 
			}
			
			
	    	if(!$scope.isDisabledEdit()){
				$scope.dataRelUserSettings.splice(index, 1);
				$scope.filteredRelUserSettings = $scope.dataRelUserSettings.slice(0);
				
			    $servicesStorage.RelUserSettingsDao().remove({ id: itemId }, new Object(), function(response){
			    	
			    });
		    }
	    };
	    
	    $scope.reloadData = function () {
	    	$scope.scrollable.pageNumber = 1;
	    	$scope.loadDataRelUserSettings(true);
	    };
	    
	    $scope.loadAllDataRelUserSettings = function() {
	    	$servicesStorage.RelUserSettingsDao().listView({ initDicts: true, initLists: false }, function (data) {
	    		$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataRelUserSettings = JSOG.decode(data.data);
						$scope.filteredRelUserSettings = $scope.dataRelUserSettings.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataRelUserSettings = $scope.dataRelUserSettings;
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
	    
	    $scope.loadDataRelUserSettings = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.RelUserSettingsDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataRelUserSettings = new Array();
	    			$scope.filteredRelUserSettings = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataRelUserSettings = APP.uniqueArray($scope.dataRelUserSettings.concat(JSOG.decode(data.data)));
						$scope.filteredRelUserSettings = $scope.dataRelUserSettings.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataRelUserSettings = $scope.dataRelUserSettings;
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
	    
		$scope.setSelectedItem = function (item) {
			$scope.selectedItem = APP.loadItem(item.id, $scope.selectedItems);
			
			if(JSON.stringify($scope.selectedItem) === '{}') { 
				$servicesStorage.RelUserSettingsDao().showView({ id: item.id, initDicts: true , initLists: true }, function (data) {
					$scope.selectedItem = JSOG.decode(data.data);
					$scope.selectedItems.push($scope.selectedItem);
				});
			}
			
			return $scope.selectedItem;
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataRelUserSettings(true);
		    	clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("RelUserSettings", $staticStorage));
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
.controller('RelUserSettingsSelectorCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$modalInstance', '$localStorage', '$q', 'toaster',
function ($scope, $servicesStorage, $staticStorage, $modalInstance, $localStorage, $q, toaster) {

		  $scope.dataRelUserSettings = new Array()
		, $scope.ctrl = {
				  name: 'RelUserSettingsSelectorCtrl'
				, original: 'RelUserSettings'  
		}
		, $scope.scrollable = {
				  attemptsNumber: 0
		  		, dataLoading: true
		  		, pageNumber: 1
		  		, pageSize: $staticStorage.benchmark().batchSize()
		}
		, $scope.selectedItems = new Array()
		, $scope.loading = true
		, $scope.debug = APP.debugInfo('RelUserSettingsSelectorCtrl');
		
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					dataRelUserSettings: new Object()
		  	})
		  	, $scope.dataRelUserSettings = $scope.$storage.dataRelUserSettings;
	  	}

		APP.defaultSelectorCtrl($scope, $modalInstance, $servicesStorage, $staticStorage, $q, toaster);
		
		$scope.loadDataRelUserSettings = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.RelUserSettingsDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataRelUserSettings = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				$scope.loading = false;
				
				if(data.success){
					if (data.total > 0) {
						$scope.dataRelUserSettings = APP.uniqueArray($scope.dataRelUserSettings.concat(JSOG.decode(data.data)));
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataRelUserSettings = $scope.dataRelUserSettings;
						}
					}
				}
				else {
					$scope.scrollable.pageNumber--;
					toaster.pop('error', data.message);
				}
	 		});
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataRelUserSettings(true);
				clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("RelUserSettings", $staticStorage));
		};
		
		init();
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
}])
.controller('RelUserSettingsEditCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$modal', '$modalInstance', 'modalSettings', '$servicesStorage', '$filter', '$localStorage', '$staticStorage', 'toaster', '$q', 'APP_INFO', 
function ($scope, $rootScope, $routeParams, $location, $modal, $modalInstance, modalSettings, $servicesStorage, $filter, $localStorage, $staticStorage, toaster, $q, APP_INFO) {
	
		  $scope.item = new Object()
		, $scope.ctrl = {
			  name: 'RelUserSettingsEditCtrl'
			, original: 'RelUserSettings'  
		}
		, $scope.itemId = -1
		, $scope.itemIndex = -1
		, $scope.loading = true
		, $scope.access = {
			    edit: false
			  , editsimple: false
			  , create: false
			  , createsimple: false
		}
		, $scope.scrollable = {
				  id: modalSettings.editItemId == -1 ? $routeParams.id : modalSettings.editItemId
				, initDicts: true 
				, initLists: true
		}
		, $scope.selectedItem = new Object()
		, $scope.details = new Object()
		, $scope.debug = APP.debugInfo('RelUserSettingsEditCtrl');
		//, $scope.tinymceOptions = APP.loadtinymceOption();
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					itemRelUserSettings: new Object()
		  	});
		}
		
		APP.defaultEditCtrl($scope, $modal, $modalInstance, modalSettings, $servicesStorage, $staticStorage, 'RelUserSettings', $filter, $location, $rootScope, toaster, APP_INFO);
		
		$scope.updateItem = function () {
			$scope.loading = true;
			var identity = $scope.item.id
			,	item = JSOG.stringify($scope.item);
			
			if(APP_INFO.debug){
				console.info('$scope.updateItem#item: ', $scope.item);
			}
			
			if($scope.access.edit || $scope.access.editsimple){
				$servicesStorage.RelUserSettingsDao().update({id: identity}, item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/RelusersettingsList');
					}
				});
			}
			else if($scope.access.create || $scope.access.createsimple){
				$servicesStorage.RelUserSettingsDao().create(item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/RelusersettingsList');
					}
				});
			}
			
		};
	
		/*---------------------------*/
		
		function init(callback) {
		
			if(callback){
				callback();
			}
		
			var timer = setTimeout(function() {
				$scope.loading = APP.checkItem($scope.item, modalSettings);
			
				if($scope.access.edit || $scope.access.editsimple){
					$servicesStorage.RelUserSettingsDao().showObj($scope.scrollable, function (data) {
						$scope.item = JSOG.decode(data.data);
						if($staticStorage.benchmark().isCacheble()){ 
							$scope.$storage.itemRelUserSettings = data.data;
						} 
						$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
						
						APP.afterLoadingDataEditCtrl($scope, $staticStorage, 'RelUserSettings');
					});
				}
				else {
					$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
				}
			
			if($staticStorage.benchmark().isCacheble()){
				$scope.dataSettings = $scope.$storage.dataSettings;
			}
			$servicesStorage.SettingsDao().listScrollable({initDicts: false, initLists: false, pageNumber:1, pageSize: 10}, function (data) {
				$scope.dataSettings = JSOG.decode(data.data);
				if($staticStorage.benchmark().isCacheble()){ 
					$scope.$storage.dataSettings = $scope.dataSettings;
				}
			});

			if($staticStorage.benchmark().isCacheble()){
				$scope.dataUsers = $scope.$storage.dataUsers;
			}
			$servicesStorage.UsersDao().listScrollable({initDicts: false, initLists: false, pageNumber:1, pageSize: 10}, function (data) {
				$scope.dataUsers = JSOG.decode(data.data);
				if($staticStorage.benchmark().isCacheble()){ 
					$scope.$storage.dataUsers = $scope.dataUsers;
				}
			});

		
				clearTimeout(timer);
		    	timer = null;
		
			}, APP.timeOutCount("RelUserSettings", $staticStorage));
		};
		
		init(function() {
			APP.beforeLoadingDataEditCtrl($scope, $staticStorage, modalSettings, 'RelUserSettings');
		});
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
		/*---------------------------*/


		/*---------------------------*/
		

		/*---------------------------*/
		

		
}])

/*===========================*/

.controller('SettingsListCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$location', '$route', '$filter', '$modal', '$localStorage', 'toaster',  
function ($scope, $servicesStorage, $staticStorage, $location, $route, $filter, $modal, $localStorage, toaster) {

		function variables() {
			  $scope.dataSettings = new Array()
			, $scope.ctrl = {
					  name: 'SettingsListCtrl'
					, original: 'Settings'  
			}  
			, $scope.scrollable = {
					  attemptsNumber: 0
			  		, dataLoading: true
			  		, pageNumber: 1
			  		, pageSize: $staticStorage.benchmark().batchSize()
			}
			, $scope.selectedItem = new Object()
			, $scope.selectedItems = new Array()
			, $scope.excludes = [ 'settings' ]
			, $scope.details = new Object() 
			, $scope.debug = APP.debugInfo('SettingsListCtrl');
			
			if($staticStorage.benchmark().isCacheble()){
				$scope.$storage = $localStorage.$default({
						dataSettings: new Array()
			  	})
			  	, $scope.dataSettings = $scope.$storage.dataSettings;
			}
			
			APP.defaultListCtrl($scope, $filter);
		};
		
		$scope.createModalNewItem = function () {
			if($staticStorage.benchmark().isModal()){
				var modalInstance = $modal.open({
					templateUrl: 'SettingsEdit',
					controller: 'SettingsEditCtrl',
					backdrop: 'static', 
					resolve: {
						modalSettings: function () { 
							return { 
								  item: $scope.selectedItem
								, mode: "create"
								, isModal: true
								, isSimple: false
								, editItem: new Object()
								, editItemId: -1
								, excludeList: [ 'settings' ]
							}; 
						}
					}
				});
				
				modalInstance.result.then(function (data) {
					$servicesStorage.SettingsDao().showView({ id: data.item.id, initDicts: true, initLists: false }, function (response) {
						if(response.success){
							$scope.dataSettings.unshift(JSOG.decode(response.data));
						}
						else {
							toaster.pop('error', response.message);
						}
					});
				
				}, function(){});
			}
			else {
				$location.path('/SettingsCreate');
			}
		};

		$scope.editModalItem = function (itemId) {
			if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
		
			if(!$scope.isDisabledEdit()){
				if($staticStorage.benchmark().isModal()){
					var modalInstance = $modal.open({
						templateUrl: 'SettingsEdit/' + itemId,
						controller: 'SettingsEditCtrl',
						backdrop: 'static', 
						resolve: {
							modalSettings: function () { 
								return { 
									  item: $scope.selectedItem
									, mode: "edit"
									, isModal: true
									, isSimple: false
									, editItem: $scope.selectedItem
									, editItemId: itemId
									, excludeList: [ 'settings' ]
									, index: APP.loadIndex($scope.selectedItem.id, $scope.dataSettings)
								}; 
							}
						}
					});
		
				    modalInstance.result.then(function(data){
				    	$servicesStorage.SettingsDao().showView({ id: data.item.id, initDicts: true, initLists: true }, function (response) {
				    		$scope.dataSettings[data.index] = JSOG.decode(response.data);
							$scope.selectedItem = $scope.dataSettings[data.index];
						});
				    }, function(){
				    	
				    });
			    }
			    else {
			    	$location.path('/SettingsEdit/' + itemId);
			    }
		    }
		};
	
	    $scope.deleteItem = function (itemId, index) {
	    	if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
			
	    	if(typeof index == 'undefined'){
	    		index = APP.loadIndex(itemId, $scope.dataSettings); 
			}
			
			
	    	if(!$scope.isDisabledEdit()){
				$scope.dataSettings.splice(index, 1);
				$scope.filteredSettings = $scope.dataSettings.slice(0);
				
			    $servicesStorage.SettingsDao().remove({ id: itemId }, new Object(), function(response){
			    	
			    });
		    }
	    };
	    
	    $scope.reloadData = function () {
	    	$scope.scrollable.pageNumber = 1;
	    	$scope.loadDataSettings(true);
	    };
	    
	    $scope.loadAllDataSettings = function() {
	    	$servicesStorage.SettingsDao().listView({ initDicts: true, initLists: false }, function (data) {
	    		$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataSettings = JSOG.decode(data.data);
						$scope.filteredSettings = $scope.dataSettings.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataSettings = $scope.dataSettings;
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
	    
	    $scope.loadDataSettings = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.SettingsDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataSettings = new Array();
	    			$scope.filteredSettings = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataSettings = APP.uniqueArray($scope.dataSettings.concat(JSOG.decode(data.data)));
						$scope.filteredSettings = $scope.dataSettings.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataSettings = $scope.dataSettings;
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
	    
		$scope.setSelectedItem = function (item) {
			$scope.selectedItem = APP.loadItem(item.id, $scope.selectedItems);
			
			if(JSON.stringify($scope.selectedItem) === '{}') { 
				$servicesStorage.SettingsDao().showView({ id: item.id, initDicts: true , initLists: true }, function (data) {
					$scope.selectedItem = JSOG.decode(data.data);
					$scope.selectedItems.push($scope.selectedItem);
				});
			}
			
			return $scope.selectedItem;
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataSettings(true);
		    	clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("Settings", $staticStorage));
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
.controller('SettingsSelectorCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$modalInstance', '$localStorage', '$q', 'toaster',
function ($scope, $servicesStorage, $staticStorage, $modalInstance, $localStorage, $q, toaster) {

		  $scope.dataSettings = new Array()
		, $scope.ctrl = {
				  name: 'SettingsSelectorCtrl'
				, original: 'Settings'  
		}
		, $scope.scrollable = {
				  attemptsNumber: 0
		  		, dataLoading: true
		  		, pageNumber: 1
		  		, pageSize: $staticStorage.benchmark().batchSize()
		}
		, $scope.selectedItems = new Array()
		, $scope.loading = true
		, $scope.debug = APP.debugInfo('SettingsSelectorCtrl');
		
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					dataSettings: new Object()
		  	})
		  	, $scope.dataSettings = $scope.$storage.dataSettings;
	  	}

		APP.defaultSelectorCtrl($scope, $modalInstance, $servicesStorage, $staticStorage, $q, toaster);
		
		$scope.loadDataSettings = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.SettingsDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataSettings = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				$scope.loading = false;
				
				if(data.success){
					if (data.total > 0) {
						$scope.dataSettings = APP.uniqueArray($scope.dataSettings.concat(JSOG.decode(data.data)));
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataSettings = $scope.dataSettings;
						}
					}
				}
				else {
					$scope.scrollable.pageNumber--;
					toaster.pop('error', data.message);
				}
	 		});
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataSettings(true);
				clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("Settings", $staticStorage));
		};
		
		init();
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
}])
.controller('SettingsEditCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$modal', '$modalInstance', 'modalSettings', '$servicesStorage', '$filter', '$localStorage', '$staticStorage', 'toaster', '$q', 'APP_INFO', 
function ($scope, $rootScope, $routeParams, $location, $modal, $modalInstance, modalSettings, $servicesStorage, $filter, $localStorage, $staticStorage, toaster, $q, APP_INFO) {
	
		  $scope.item = new Object()
		, $scope.ctrl = {
			  name: 'SettingsEditCtrl'
			, original: 'Settings'  
		}
		, $scope.itemId = -1
		, $scope.itemIndex = -1
		, $scope.loading = true
		, $scope.access = {
			    edit: false
			  , editsimple: false
			  , create: false
			  , createsimple: false
		}
		, $scope.scrollable = {
				  id: modalSettings.editItemId == -1 ? $routeParams.id : modalSettings.editItemId
				, initDicts: true 
				, initLists: true
		}
		, $scope.selectedItem = new Object()
		, $scope.details = new Object()
		, $scope.debug = APP.debugInfo('SettingsEditCtrl');
		//, $scope.tinymceOptions = APP.loadtinymceOption();
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					itemSettings: new Object()
		  	});
		}
		
		APP.defaultEditCtrl($scope, $modal, $modalInstance, modalSettings, $servicesStorage, $staticStorage, 'Settings', $filter, $location, $rootScope, toaster, APP_INFO);
		
		$scope.updateItem = function () {
			$scope.loading = true;
			var identity = $scope.item.id
			,	item = JSOG.stringify($scope.item);
			
			if(APP_INFO.debug){
				console.info('$scope.updateItem#item: ', $scope.item);
			}
			
			if($scope.access.edit || $scope.access.editsimple){
				$servicesStorage.SettingsDao().update({id: identity}, item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/SettingsList');
					}
				});
			}
			else if($scope.access.create || $scope.access.createsimple){
				$servicesStorage.SettingsDao().create(item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/SettingsList');
					}
				});
			}
			
		};
	
		/*---------------------------*/
		
		function init(callback) {
		
			if(callback){
				callback();
			}
		
			var timer = setTimeout(function() {
				$scope.loading = APP.checkItem($scope.item, modalSettings);
			
				if($scope.access.edit || $scope.access.editsimple){
					$servicesStorage.SettingsDao().showObj($scope.scrollable, function (data) {
						$scope.item = JSOG.decode(data.data);
						if($staticStorage.benchmark().isCacheble()){ 
							$scope.$storage.itemSettings = data.data;
						} 
						$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
						
						APP.afterLoadingDataEditCtrl($scope, $staticStorage, 'Settings');
					});
				}
				else {
					$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
				}
			

		
				clearTimeout(timer);
		    	timer = null;
		
			}, APP.timeOutCount("Settings", $staticStorage));
		};
		
		init(function() {
			APP.beforeLoadingDataEditCtrl($scope, $staticStorage, modalSettings, 'Settings');
		});
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
		/*---------------------------*/

		$scope.editModalItemRelUserSettings = function (itemId) {
			var modalInstance = $modal.open({
				templateUrl: 'RelusersettingsEdit',
				controller: 'RelUserSettingsEditCtrl',
				resolve: {
					modalSettings: function () { 
						return { 
							  item: $scope.item
							, mode: "edit"
							, isModal: true
							, isSimple: false
							, editItem: $scope.selectedItemrelUserSettingses
							, editItemId: itemId
							, excludeList: [ 'settings' ]
						} 
					}
				}
			});
			
			modalInstance.result.then(function(item){
				
			}, function(){});
		};
		

		/*---------------------------*/
		
		$scope.createModalItemRelUserSettings = function () {
			if(typeof $scope.item.relUserSettingses == "undefined"){
				$scope.item.relUserSettingses = [];
			}
		
			var modalInstance = $modal.open({
				templateUrl: 'RelusersettingsEdit',
				controller: 'RelUserSettingsEditCtrl',
				resolve: {
					modalSettings: function () { 
						return { 
							  item: $scope.item
							, mode: "create"
							, isModal: true
							, isSimple: false
							, insertParent: true
							, editItem: {}
							, editItemId: -1
							, excludeList: [ 'settings' ]
						} 
					}
				}
			});
			
			modalInstance.result.then(function(item){
				if(APP_INFO.debug){
					console.info('$scope.createModalItemRelUserSettings#item: ', item);
				}
				$scope.item.relUserSettingses.push(item.item);
			}, function(){});
		};
		

		/*---------------------------*/
		
		$scope.pickItemRelUserSettings = function () {
			var modalInstance = $modal.open({
				templateUrl: 'UsersFragmentSelector',
				controller: 'UsersSelectorCtrl',
				resolve: {
					item: function () { return $scope.selectedItem; }
				}
			});
			
			modalInstance.result.then(function (data) {
				$scope.item.relUserSettingses = APP.checkDublicate(
							$scope.item.relUserSettingses
						  , data.data
						  , 'users'
						  , 'settings'
						  , $scope.item
				);
				
			}, function(){});
		};
	

		
}])

/*===========================*/

.controller('TmUserInfoListCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$location', '$route', '$filter', '$modal', '$localStorage', 'toaster',  
function ($scope, $servicesStorage, $staticStorage, $location, $route, $filter, $modal, $localStorage, toaster) {

		function variables() {
			  $scope.dataTmUserInfo = new Array()
			, $scope.ctrl = {
					  name: 'TmUserInfoListCtrl'
					, original: 'TmUserInfo'  
			}  
			, $scope.scrollable = {
					  attemptsNumber: 0
			  		, dataLoading: true
			  		, pageNumber: 1
			  		, pageSize: $staticStorage.benchmark().batchSize()
			}
			, $scope.selectedItem = new Object()
			, $scope.selectedItems = new Array()
			, $scope.excludes = [ 'tmuserinfo' ]
			, $scope.details = new Object() 
			, $scope.debug = APP.debugInfo('TmUserInfoListCtrl');
			
			if($staticStorage.benchmark().isCacheble()){
				$scope.$storage = $localStorage.$default({
						dataTmUserInfo: new Array()
			  	})
			  	, $scope.dataTmUserInfo = $scope.$storage.dataTmUserInfo;
			}
			
			APP.defaultListCtrl($scope, $filter);
		};
		
		$scope.createModalNewItem = function () {
			if($staticStorage.benchmark().isModal()){
				var modalInstance = $modal.open({
					templateUrl: 'TmuserinfoEdit',
					controller: 'TmUserInfoEditCtrl',
					backdrop: 'static', 
					resolve: {
						modalSettings: function () { 
							return { 
								  item: $scope.selectedItem
								, mode: "create"
								, isModal: true
								, isSimple: false
								, editItem: new Object()
								, editItemId: -1
								, excludeList: [ 'tmuserinfo' ]
							}; 
						}
					}
				});
				
				modalInstance.result.then(function (data) {
					$servicesStorage.TmUserInfoDao().showView({ id: data.item.id, initDicts: true, initLists: false }, function (response) {
						if(response.success){
							$scope.dataTmUserInfo.unshift(JSOG.decode(response.data));
						}
						else {
							toaster.pop('error', response.message);
						}
					});
				
				}, function(){});
			}
			else {
				$location.path('/TmuserinfoCreate');
			}
		};

		$scope.editModalItem = function (itemId) {
			if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
		
			if(!$scope.isDisabledEdit()){
				if($staticStorage.benchmark().isModal()){
					var modalInstance = $modal.open({
						templateUrl: 'TmuserinfoEdit/' + itemId,
						controller: 'TmUserInfoEditCtrl',
						backdrop: 'static', 
						resolve: {
							modalSettings: function () { 
								return { 
									  item: $scope.selectedItem
									, mode: "edit"
									, isModal: true
									, isSimple: false
									, editItem: $scope.selectedItem
									, editItemId: itemId
									, excludeList: [ 'tmuserinfo' ]
									, index: APP.loadIndex($scope.selectedItem.id, $scope.dataTmUserInfo)
								}; 
							}
						}
					});
		
				    modalInstance.result.then(function(data){
				    	$servicesStorage.TmUserInfoDao().showView({ id: data.item.id, initDicts: true, initLists: true }, function (response) {
				    		$scope.dataTmUserInfo[data.index] = JSOG.decode(response.data);
							$scope.selectedItem = $scope.dataTmUserInfo[data.index];
						});
				    }, function(){
				    	
				    });
			    }
			    else {
			    	$location.path('/TmuserinfoEdit/' + itemId);
			    }
		    }
		};
	
	    $scope.deleteItem = function (itemId, index) {
	    	if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
			
	    	if(typeof index == 'undefined'){
	    		index = APP.loadIndex(itemId, $scope.dataTmUserInfo); 
			}
			
			
	    	if(!$scope.isDisabledEdit()){
				$scope.dataTmUserInfo.splice(index, 1);
				$scope.filteredTmUserInfo = $scope.dataTmUserInfo.slice(0);
				
			    $servicesStorage.TmUserInfoDao().remove({ id: itemId }, new Object(), function(response){
			    	
			    });
		    }
	    };
	    
	    $scope.reloadData = function () {
	    	$scope.scrollable.pageNumber = 1;
	    	$scope.loadDataTmUserInfo(true);
	    };
	    
	    $scope.loadAllDataTmUserInfo = function() {
	    	$servicesStorage.TmUserInfoDao().listView({ initDicts: true, initLists: false }, function (data) {
	    		$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataTmUserInfo = JSOG.decode(data.data);
						$scope.filteredTmUserInfo = $scope.dataTmUserInfo.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataTmUserInfo = $scope.dataTmUserInfo;
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
	    
	    $scope.loadDataTmUserInfo = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.TmUserInfoDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataTmUserInfo = new Array();
	    			$scope.filteredTmUserInfo = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataTmUserInfo = APP.uniqueArray($scope.dataTmUserInfo.concat(JSOG.decode(data.data)));
						$scope.filteredTmUserInfo = $scope.dataTmUserInfo.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataTmUserInfo = $scope.dataTmUserInfo;
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
	    
		$scope.setSelectedItem = function (item) {
			$scope.selectedItem = APP.loadItem(item.id, $scope.selectedItems);
			
			if(JSON.stringify($scope.selectedItem) === '{}') { 
				$servicesStorage.TmUserInfoDao().showView({ id: item.id, initDicts: true , initLists: true }, function (data) {
					$scope.selectedItem = JSOG.decode(data.data);
					$scope.selectedItems.push($scope.selectedItem);
				});
			}
			
			return $scope.selectedItem;
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataTmUserInfo(true);
		    	clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("TmUserInfo", $staticStorage));
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
.controller('TmUserInfoSelectorCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$modalInstance', '$localStorage', '$q', 'toaster',
function ($scope, $servicesStorage, $staticStorage, $modalInstance, $localStorage, $q, toaster) {

		  $scope.dataTmUserInfo = new Array()
		, $scope.ctrl = {
				  name: 'TmUserInfoSelectorCtrl'
				, original: 'TmUserInfo'  
		}
		, $scope.scrollable = {
				  attemptsNumber: 0
		  		, dataLoading: true
		  		, pageNumber: 1
		  		, pageSize: $staticStorage.benchmark().batchSize()
		}
		, $scope.selectedItems = new Array()
		, $scope.loading = true
		, $scope.debug = APP.debugInfo('TmUserInfoSelectorCtrl');
		
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					dataTmUserInfo: new Object()
		  	})
		  	, $scope.dataTmUserInfo = $scope.$storage.dataTmUserInfo;
	  	}

		APP.defaultSelectorCtrl($scope, $modalInstance, $servicesStorage, $staticStorage, $q, toaster);
		
		$scope.loadDataTmUserInfo = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.TmUserInfoDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataTmUserInfo = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				$scope.loading = false;
				
				if(data.success){
					if (data.total > 0) {
						$scope.dataTmUserInfo = APP.uniqueArray($scope.dataTmUserInfo.concat(JSOG.decode(data.data)));
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataTmUserInfo = $scope.dataTmUserInfo;
						}
					}
				}
				else {
					$scope.scrollable.pageNumber--;
					toaster.pop('error', data.message);
				}
	 		});
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataTmUserInfo(true);
				clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("TmUserInfo", $staticStorage));
		};
		
		init();
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
}])
.controller('TmUserInfoEditCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$modal', '$modalInstance', 'modalSettings', '$servicesStorage', '$filter', '$localStorage', '$staticStorage', 'toaster', '$q', 'APP_INFO', 
function ($scope, $rootScope, $routeParams, $location, $modal, $modalInstance, modalSettings, $servicesStorage, $filter, $localStorage, $staticStorage, toaster, $q, APP_INFO) {
	
		  $scope.item = new Object()
		, $scope.ctrl = {
			  name: 'TmUserInfoEditCtrl'
			, original: 'TmUserInfo'  
		}
		, $scope.itemId = -1
		, $scope.itemIndex = -1
		, $scope.loading = true
		, $scope.access = {
			    edit: false
			  , editsimple: false
			  , create: false
			  , createsimple: false
		}
		, $scope.scrollable = {
				  id: modalSettings.editItemId == -1 ? $routeParams.id : modalSettings.editItemId
				, initDicts: true 
				, initLists: true
		}
		, $scope.selectedItem = new Object()
		, $scope.details = new Object()
		, $scope.debug = APP.debugInfo('TmUserInfoEditCtrl');
		//, $scope.tinymceOptions = APP.loadtinymceOption();
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					itemTmUserInfo: new Object()
		  	});
		}
		
		APP.defaultEditCtrl($scope, $modal, $modalInstance, modalSettings, $servicesStorage, $staticStorage, 'TmUserInfo', $filter, $location, $rootScope, toaster, APP_INFO);
		
		$scope.updateItem = function () {
			$scope.loading = true;
			var identity = $scope.item.id
			,	item = JSOG.stringify($scope.item);
			
			if(APP_INFO.debug){
				console.info('$scope.updateItem#item: ', $scope.item);
			}
			
			if($scope.access.edit || $scope.access.editsimple){
				$servicesStorage.TmUserInfoDao().update({id: identity}, item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/TmuserinfoList');
					}
				});
			}
			else if($scope.access.create || $scope.access.createsimple){
				$servicesStorage.TmUserInfoDao().create(item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/TmuserinfoList');
					}
				});
			}
			
		};
	
		/*---------------------------*/
		
		function init(callback) {
		
			if(callback){
				callback();
			}
		
			var timer = setTimeout(function() {
				$scope.loading = APP.checkItem($scope.item, modalSettings);
			
				if($scope.access.edit || $scope.access.editsimple){
					$servicesStorage.TmUserInfoDao().showObj($scope.scrollable, function (data) {
						$scope.item = JSOG.decode(data.data);
						if($staticStorage.benchmark().isCacheble()){ 
							$scope.$storage.itemTmUserInfo = data.data;
						} 
						$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
						
						APP.afterLoadingDataEditCtrl($scope, $staticStorage, 'TmUserInfo');
					});
				}
				else {
					$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
				}
			

		
				clearTimeout(timer);
		    	timer = null;
		
			}, APP.timeOutCount("TmUserInfo", $staticStorage));
		};
		
		init(function() {
			APP.beforeLoadingDataEditCtrl($scope, $staticStorage, modalSettings, 'TmUserInfo');
		});
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
		/*---------------------------*/


		/*---------------------------*/
		

		/*---------------------------*/
		

		
}])

/*===========================*/

.controller('UserRolesListCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$location', '$route', '$filter', '$modal', '$localStorage', 'toaster',  
function ($scope, $servicesStorage, $staticStorage, $location, $route, $filter, $modal, $localStorage, toaster) {

		function variables() {
			  $scope.dataUserRoles = new Array()
			, $scope.ctrl = {
					  name: 'UserRolesListCtrl'
					, original: 'UserRoles'  
			}  
			, $scope.scrollable = {
					  attemptsNumber: 0
			  		, dataLoading: true
			  		, pageNumber: 1
			  		, pageSize: $staticStorage.benchmark().batchSize()
			}
			, $scope.selectedItem = new Object()
			, $scope.selectedItems = new Array()
			, $scope.excludes = [ 'userroles' ]
			, $scope.details = new Object() 
			, $scope.debug = APP.debugInfo('UserRolesListCtrl');
			
			if($staticStorage.benchmark().isCacheble()){
				$scope.$storage = $localStorage.$default({
						dataUserRoles: new Array()
			  	})
			  	, $scope.dataUserRoles = $scope.$storage.dataUserRoles;
			}
			
			APP.defaultListCtrl($scope, $filter);
		};
		
		$scope.createModalNewItem = function () {
			if($staticStorage.benchmark().isModal()){
				var modalInstance = $modal.open({
					templateUrl: 'UserrolesEdit',
					controller: 'UserRolesEditCtrl',
					backdrop: 'static', 
					resolve: {
						modalSettings: function () { 
							return { 
								  item: $scope.selectedItem
								, mode: "create"
								, isModal: true
								, isSimple: false
								, editItem: new Object()
								, editItemId: -1
								, excludeList: [ 'userroles' ]
							}; 
						}
					}
				});
				
				modalInstance.result.then(function (data) {
					$servicesStorage.UserRolesDao().showView({ id: data.item.id, initDicts: true, initLists: false }, function (response) {
						if(response.success){
							$scope.dataUserRoles.unshift(JSOG.decode(response.data));
						}
						else {
							toaster.pop('error', response.message);
						}
					});
				
				}, function(){});
			}
			else {
				$location.path('/UserrolesCreate');
			}
		};

		$scope.editModalItem = function (itemId) {
			if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
		
			if(!$scope.isDisabledEdit()){
				if($staticStorage.benchmark().isModal()){
					var modalInstance = $modal.open({
						templateUrl: 'UserrolesEdit/' + itemId,
						controller: 'UserRolesEditCtrl',
						backdrop: 'static', 
						resolve: {
							modalSettings: function () { 
								return { 
									  item: $scope.selectedItem
									, mode: "edit"
									, isModal: true
									, isSimple: false
									, editItem: $scope.selectedItem
									, editItemId: itemId
									, excludeList: [ 'userroles' ]
									, index: APP.loadIndex($scope.selectedItem.id, $scope.dataUserRoles)
								}; 
							}
						}
					});
		
				    modalInstance.result.then(function(data){
				    	$servicesStorage.UserRolesDao().showView({ id: data.item.id, initDicts: true, initLists: true }, function (response) {
				    		$scope.dataUserRoles[data.index] = JSOG.decode(response.data);
							$scope.selectedItem = $scope.dataUserRoles[data.index];
						});
				    }, function(){
				    	
				    });
			    }
			    else {
			    	$location.path('/UserrolesEdit/' + itemId);
			    }
		    }
		};
	
	    $scope.deleteItem = function (itemId, index) {
	    	if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
			
	    	if(typeof index == 'undefined'){
	    		index = APP.loadIndex(itemId, $scope.dataUserRoles); 
			}
			
			
	    	if(!$scope.isDisabledEdit()){
				$scope.dataUserRoles.splice(index, 1);
				$scope.filteredUserRoles = $scope.dataUserRoles.slice(0);
				
			    $servicesStorage.UserRolesDao().remove({ id: itemId }, new Object(), function(response){
			    	
			    });
		    }
	    };
	    
	    $scope.reloadData = function () {
	    	$scope.scrollable.pageNumber = 1;
	    	$scope.loadDataUserRoles(true);
	    };
	    
	    $scope.loadAllDataUserRoles = function() {
	    	$servicesStorage.UserRolesDao().listView({ initDicts: true, initLists: false }, function (data) {
	    		$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataUserRoles = JSOG.decode(data.data);
						$scope.filteredUserRoles = $scope.dataUserRoles.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataUserRoles = $scope.dataUserRoles;
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
	    
	    $scope.loadDataUserRoles = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.UserRolesDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataUserRoles = new Array();
	    			$scope.filteredUserRoles = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataUserRoles = APP.uniqueArray($scope.dataUserRoles.concat(JSOG.decode(data.data)));
						$scope.filteredUserRoles = $scope.dataUserRoles.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataUserRoles = $scope.dataUserRoles;
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
	    
		$scope.setSelectedItem = function (item) {
			$scope.selectedItem = APP.loadItem(item.id, $scope.selectedItems);
			
			if(JSON.stringify($scope.selectedItem) === '{}') { 
				$servicesStorage.UserRolesDao().showView({ id: item.id, initDicts: true , initLists: true }, function (data) {
					$scope.selectedItem = JSOG.decode(data.data);
					$scope.selectedItems.push($scope.selectedItem);
				});
			}
			
			return $scope.selectedItem;
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataUserRoles(true);
		    	clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("UserRoles", $staticStorage));
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
.controller('UserRolesSelectorCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$modalInstance', '$localStorage', '$q', 'toaster',
function ($scope, $servicesStorage, $staticStorage, $modalInstance, $localStorage, $q, toaster) {

		  $scope.dataUserRoles = new Array()
		, $scope.ctrl = {
				  name: 'UserRolesSelectorCtrl'
				, original: 'UserRoles'  
		}
		, $scope.scrollable = {
				  attemptsNumber: 0
		  		, dataLoading: true
		  		, pageNumber: 1
		  		, pageSize: $staticStorage.benchmark().batchSize()
		}
		, $scope.selectedItems = new Array()
		, $scope.loading = true
		, $scope.debug = APP.debugInfo('UserRolesSelectorCtrl');
		
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					dataUserRoles: new Object()
		  	})
		  	, $scope.dataUserRoles = $scope.$storage.dataUserRoles;
	  	}

		APP.defaultSelectorCtrl($scope, $modalInstance, $servicesStorage, $staticStorage, $q, toaster);
		
		$scope.loadDataUserRoles = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.UserRolesDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataUserRoles = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				$scope.loading = false;
				
				if(data.success){
					if (data.total > 0) {
						$scope.dataUserRoles = APP.uniqueArray($scope.dataUserRoles.concat(JSOG.decode(data.data)));
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataUserRoles = $scope.dataUserRoles;
						}
					}
				}
				else {
					$scope.scrollable.pageNumber--;
					toaster.pop('error', data.message);
				}
	 		});
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataUserRoles(true);
				clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("UserRoles", $staticStorage));
		};
		
		init();
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
}])
.controller('UserRolesEditCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$modal', '$modalInstance', 'modalSettings', '$servicesStorage', '$filter', '$localStorage', '$staticStorage', 'toaster', '$q', 'APP_INFO', 
function ($scope, $rootScope, $routeParams, $location, $modal, $modalInstance, modalSettings, $servicesStorage, $filter, $localStorage, $staticStorage, toaster, $q, APP_INFO) {
	
		  $scope.item = new Object()
		, $scope.ctrl = {
			  name: 'UserRolesEditCtrl'
			, original: 'UserRoles'  
		}
		, $scope.itemId = -1
		, $scope.itemIndex = -1
		, $scope.loading = true
		, $scope.access = {
			    edit: false
			  , editsimple: false
			  , create: false
			  , createsimple: false
		}
		, $scope.scrollable = {
				  id: modalSettings.editItemId == -1 ? $routeParams.id : modalSettings.editItemId
				, initDicts: true 
				, initLists: true
		}
		, $scope.selectedItem = new Object()
		, $scope.details = new Object()
		, $scope.debug = APP.debugInfo('UserRolesEditCtrl');
		//, $scope.tinymceOptions = APP.loadtinymceOption();
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					itemUserRoles: new Object()
		  	});
		}
		
		APP.defaultEditCtrl($scope, $modal, $modalInstance, modalSettings, $servicesStorage, $staticStorage, 'UserRoles', $filter, $location, $rootScope, toaster, APP_INFO);
		
		$scope.updateItem = function () {
			$scope.loading = true;
			var identity = $scope.item.id
			,	item = JSOG.stringify($scope.item);
			
			if(APP_INFO.debug){
				console.info('$scope.updateItem#item: ', $scope.item);
			}
			
			if($scope.access.edit || $scope.access.editsimple){
				$servicesStorage.UserRolesDao().update({id: identity}, item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/UserrolesList');
					}
				});
			}
			else if($scope.access.create || $scope.access.createsimple){
				$servicesStorage.UserRolesDao().create(item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/UserrolesList');
					}
				});
			}
			
		};
	
		/*---------------------------*/
		
		function init(callback) {
		
			if(callback){
				callback();
			}
		
			var timer = setTimeout(function() {
				$scope.loading = APP.checkItem($scope.item, modalSettings);
			
				if($scope.access.edit || $scope.access.editsimple){
					$servicesStorage.UserRolesDao().showObj($scope.scrollable, function (data) {
						$scope.item = JSOG.decode(data.data);
						if($staticStorage.benchmark().isCacheble()){ 
							$scope.$storage.itemUserRoles = data.data;
						} 
						$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
						
						APP.afterLoadingDataEditCtrl($scope, $staticStorage, 'UserRoles');
					});
				}
				else {
					$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
				}
			
			if($staticStorage.benchmark().isCacheble()){
				$scope.dataUsers = $scope.$storage.dataUsers;
			}
			$servicesStorage.UsersDao().listScrollable({initDicts: false, initLists: false, pageNumber:1, pageSize: 10}, function (data) {
				$scope.dataUsers = JSOG.decode(data.data);
				if($staticStorage.benchmark().isCacheble()){ 
					$scope.$storage.dataUsers = $scope.dataUsers;
				}
			});

		
				clearTimeout(timer);
		    	timer = null;
		
			}, APP.timeOutCount("UserRoles", $staticStorage));
		};
		
		init(function() {
			APP.beforeLoadingDataEditCtrl($scope, $staticStorage, modalSettings, 'UserRoles');
		});
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
		/*---------------------------*/


		/*---------------------------*/
		

		/*---------------------------*/
		

		
}])

/*===========================*/

.controller('UsersListCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$location', '$route', '$filter', '$modal', '$localStorage', 'toaster',  
function ($scope, $servicesStorage, $staticStorage, $location, $route, $filter, $modal, $localStorage, toaster) {

		function variables() {
			  $scope.dataUsers = new Array()
			, $scope.ctrl = {
					  name: 'UsersListCtrl'
					, original: 'Users'  
			}  
			, $scope.scrollable = {
					  attemptsNumber: 0
			  		, dataLoading: true
			  		, pageNumber: 1
			  		, pageSize: $staticStorage.benchmark().batchSize()
			}
			, $scope.selectedItem = new Object()
			, $scope.selectedItems = new Array()
			, $scope.excludes = [ 'users' ]
			, $scope.details = new Object() 
			, $scope.debug = APP.debugInfo('UsersListCtrl');
			
			if($staticStorage.benchmark().isCacheble()){
				$scope.$storage = $localStorage.$default({
						dataUsers: new Array()
			  	})
			  	, $scope.dataUsers = $scope.$storage.dataUsers;
			}
			
			APP.defaultListCtrl($scope, $filter);
		};
		
		$scope.createModalNewItem = function () {
			if($staticStorage.benchmark().isModal()){
				var modalInstance = $modal.open({
					templateUrl: 'UsersEdit',
					controller: 'UsersEditCtrl',
					backdrop: 'static', 
					resolve: {
						modalSettings: function () { 
							return { 
								  item: $scope.selectedItem
								, mode: "create"
								, isModal: true
								, isSimple: false
								, editItem: new Object()
								, editItemId: -1
								, excludeList: [ 'users' ]
							}; 
						}
					}
				});
				
				modalInstance.result.then(function (data) {
					$servicesStorage.UsersDao().showView({ id: data.item.id, initDicts: true, initLists: false }, function (response) {
						if(response.success){
							$scope.dataUsers.unshift(JSOG.decode(response.data));
						}
						else {
							toaster.pop('error', response.message);
						}
					});
				
				}, function(){});
			}
			else {
				$location.path('/UsersCreate');
			}
		};

		$scope.editModalItem = function (itemId) {
			if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
		
			if(!$scope.isDisabledEdit()){
				if($staticStorage.benchmark().isModal()){
					var modalInstance = $modal.open({
						templateUrl: 'UsersEdit/' + itemId,
						controller: 'UsersEditCtrl',
						backdrop: 'static', 
						resolve: {
							modalSettings: function () { 
								return { 
									  item: $scope.selectedItem
									, mode: "edit"
									, isModal: true
									, isSimple: false
									, editItem: $scope.selectedItem
									, editItemId: itemId
									, excludeList: [ 'users' ]
									, index: APP.loadIndex($scope.selectedItem.id, $scope.dataUsers)
								}; 
							}
						}
					});
		
				    modalInstance.result.then(function(data){
				    	$servicesStorage.UsersDao().showView({ id: data.item.id, initDicts: true, initLists: true }, function (response) {
				    		$scope.dataUsers[data.index] = JSOG.decode(response.data);
							$scope.selectedItem = $scope.dataUsers[data.index];
						});
				    }, function(){
				    	
				    });
			    }
			    else {
			    	$location.path('/UsersEdit/' + itemId);
			    }
		    }
		};
	
	    $scope.deleteItem = function (itemId, index) {
	    	if(typeof itemId == 'undefined'){
				itemId = $scope.selectedItem.id;
			}
			
	    	if(typeof index == 'undefined'){
	    		index = APP.loadIndex(itemId, $scope.dataUsers); 
			}
			
			
	    	if(!$scope.isDisabledEdit()){
				$scope.dataUsers.splice(index, 1);
				$scope.filteredUsers = $scope.dataUsers.slice(0);
				
			    $servicesStorage.UsersDao().remove({ id: itemId }, new Object(), function(response){
			    	
			    });
		    }
	    };
	    
	    $scope.reloadData = function () {
	    	$scope.scrollable.pageNumber = 1;
	    	$scope.loadDataUsers(true);
	    };
	    
	    $scope.loadAllDataUsers = function() {
	    	$servicesStorage.UsersDao().listView({ initDicts: true, initLists: false }, function (data) {
	    		$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataUsers = JSOG.decode(data.data);
						$scope.filteredUsers = $scope.dataUsers.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataUsers = $scope.dataUsers;
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
	    
	    $scope.loadDataUsers = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.UsersDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataUsers = new Array();
	    			$scope.filteredUsers = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				if(data.success){
					if (data.total > 0) {
						$scope.dataUsers = APP.uniqueArray($scope.dataUsers.concat(JSOG.decode(data.data)));
						$scope.filteredUsers = $scope.dataUsers.slice(0);
						
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataUsers = $scope.dataUsers;
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
	    
		$scope.setSelectedItem = function (item) {
			$scope.selectedItem = APP.loadItem(item.id, $scope.selectedItems);
			
			if(JSON.stringify($scope.selectedItem) === '{}') { 
				$servicesStorage.UsersDao().showView({ id: item.id, initDicts: true , initLists: true }, function (data) {
					$scope.selectedItem = JSOG.decode(data.data);
					$scope.selectedItems.push($scope.selectedItem);
				});
			}
			
			return $scope.selectedItem;
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataUsers(true);
		    	clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("Users", $staticStorage));
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
.controller('UsersSelectorCtrl', ['$scope', '$servicesStorage', '$staticStorage', '$modalInstance', '$localStorage', '$q', 'toaster',
function ($scope, $servicesStorage, $staticStorage, $modalInstance, $localStorage, $q, toaster) {

		  $scope.dataUsers = new Array()
		, $scope.ctrl = {
				  name: 'UsersSelectorCtrl'
				, original: 'Users'  
		}
		, $scope.scrollable = {
				  attemptsNumber: 0
		  		, dataLoading: true
		  		, pageNumber: 1
		  		, pageSize: $staticStorage.benchmark().batchSize()
		}
		, $scope.selectedItems = new Array()
		, $scope.loading = true
		, $scope.debug = APP.debugInfo('UsersSelectorCtrl');
		
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					dataUsers: new Object()
		  	})
		  	, $scope.dataUsers = $scope.$storage.dataUsers;
	  	}

		APP.defaultSelectorCtrl($scope, $modalInstance, $servicesStorage, $staticStorage, $q, toaster);
		
		$scope.loadDataUsers = function(drop) {
			$scope.scrollable.attemptsNumber++;
			$scope.scrollable.dataLoading = true;
		  	
			$servicesStorage.UsersDao().listViewScrollable({ initDicts: true , initLists: false , pageNumber: $scope.scrollable.pageNumber++ , pageSize: $scope.scrollable.pageSize}, function (data) {
				if(typeof drop !== 'undefined' && drop){
	    			$scope.dataUsers = new Array();
	    		}
			
				$scope.scrollable.dataLoading = false;
				$scope.loading = false;
				
				if(data.success){
					if (data.total > 0) {
						$scope.dataUsers = APP.uniqueArray($scope.dataUsers.concat(JSOG.decode(data.data)));
						if($staticStorage.benchmark().isCacheble()){
							$scope.$storage.dataUsers = $scope.dataUsers;
						}
					}
				}
				else {
					$scope.scrollable.pageNumber--;
					toaster.pop('error', data.message);
				}
	 		});
		};
		
		function init() {
		    var timer = setTimeout(function() {
	    		$scope.loadDataUsers(true);
				clearTimeout(timer);
		    	timer = null;
			}, APP.timeOutCount("Users", $staticStorage));
		};
		
		init();
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
}])
.controller('UsersEditCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$modal', '$modalInstance', 'modalSettings', '$servicesStorage', '$filter', '$localStorage', '$staticStorage', 'toaster', '$q', 'APP_INFO', 
function ($scope, $rootScope, $routeParams, $location, $modal, $modalInstance, modalSettings, $servicesStorage, $filter, $localStorage, $staticStorage, toaster, $q, APP_INFO) {
	
		  $scope.item = new Object()
		, $scope.ctrl = {
			  name: 'UsersEditCtrl'
			, original: 'Users'  
		}
		, $scope.itemId = -1
		, $scope.itemIndex = -1
		, $scope.loading = true
		, $scope.access = {
			    edit: false
			  , editsimple: false
			  , create: false
			  , createsimple: false
		}
		, $scope.scrollable = {
				  id: modalSettings.editItemId == -1 ? $routeParams.id : modalSettings.editItemId
				, initDicts: true 
				, initLists: true
		}
		, $scope.selectedItem = new Object()
		, $scope.details = new Object()
		, $scope.debug = APP.debugInfo('UsersEditCtrl');
		//, $scope.tinymceOptions = APP.loadtinymceOption();
		
		if($staticStorage.benchmark().isCacheble()){
			$scope.$storage = $localStorage.$default({
					itemUsers: new Object()
		  	});
		}
		
		APP.defaultEditCtrl($scope, $modal, $modalInstance, modalSettings, $servicesStorage, $staticStorage, 'Users', $filter, $location, $rootScope, toaster, APP_INFO);
		
		$scope.updateItem = function () {
			$scope.loading = true;
			var identity = $scope.item.id
			,	item = JSOG.stringify($scope.item);
			
			if(APP_INFO.debug){
				console.info('$scope.updateItem#item: ', $scope.item);
			}
			
			if($scope.access.edit || $scope.access.editsimple){
				$servicesStorage.UsersDao().update({id: identity}, item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/UsersList');
					}
				});
			}
			else if($scope.access.create || $scope.access.createsimple){
				$servicesStorage.UsersDao().create(item, function (data) {
					var result = {
						  index: modalSettings.index
						, item: new Object()
					};
					if(data.success && data.data.length > 0){
						result.item = JSOG.decode(data.data[0]);
					}
					else{
						result.item = JSOG.parse(item);
					}
					
					if(modalSettings.isModal){
						$modalInstance.close(result);
					}
					else {
						$location.path($rootScope.previousPage2);
						//$location.path('/UsersList');
					}
				});
			}
			
		};
	
		/*---------------------------*/
		
		function init(callback) {
		
			if(callback){
				callback();
			}
		
			var timer = setTimeout(function() {
				$scope.loading = APP.checkItem($scope.item, modalSettings);
			
				if($scope.access.edit || $scope.access.editsimple){
					$servicesStorage.UsersDao().showObj($scope.scrollable, function (data) {
						$scope.item = JSOG.decode(data.data);
						if($staticStorage.benchmark().isCacheble()){ 
							$scope.$storage.itemUsers = data.data;
						} 
						$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
						
						APP.afterLoadingDataEditCtrl($scope, $staticStorage, 'Users');
					});
				}
				else {
					$scope.loading = APP.checkLoading($scope.ctrl, modalSettings, $q);
				}
			

		
				clearTimeout(timer);
		    	timer = null;
		
			}, APP.timeOutCount("Users", $staticStorage));
		};
		
		init(function() {
			APP.beforeLoadingDataEditCtrl($scope, $staticStorage, modalSettings, 'Users');
		});
		
		$scope.$on('$destroy', function() {
			for (var key in $scope) {
				if (key.substr(0, 1) != '$' && key != 'this')
					delete $scope[key];
			}
		});
		
		/*---------------------------*/

		$scope.editModalItemRelUserSettings = function (itemId) {
			var modalInstance = $modal.open({
				templateUrl: 'RelusersettingsEdit',
				controller: 'RelUserSettingsEditCtrl',
				resolve: {
					modalSettings: function () { 
						return { 
							  item: $scope.item
							, mode: "edit"
							, isModal: true
							, isSimple: false
							, editItem: $scope.selectedItemrelUserSettingses
							, editItemId: itemId
							, excludeList: [ 'users' ]
						} 
					}
				}
			});
			
			modalInstance.result.then(function(item){
				
			}, function(){});
		};
		
		$scope.editModalItemUserRoles = function (itemId) {
			var modalInstance = $modal.open({
				templateUrl: 'UserrolesEdit',
				controller: 'UserRolesEditCtrl',
				resolve: {
					modalSettings: function () { 
						return { 
							  item: $scope.item
							, mode: "edit"
							, isModal: true
							, isSimple: false
							, editItem: $scope.selectedItemuserRoleses
							, editItemId: itemId
							, excludeList: [ 'users' ]
						} 
					}
				}
			});
			
			modalInstance.result.then(function(item){
				
			}, function(){});
		};
		

		/*---------------------------*/
		
		$scope.createModalItemRelUserSettings = function () {
			if(typeof $scope.item.relUserSettingses == "undefined"){
				$scope.item.relUserSettingses = [];
			}
		
			var modalInstance = $modal.open({
				templateUrl: 'RelusersettingsEdit',
				controller: 'RelUserSettingsEditCtrl',
				resolve: {
					modalSettings: function () { 
						return { 
							  item: $scope.item
							, mode: "create"
							, isModal: true
							, isSimple: false
							, insertParent: true
							, editItem: {}
							, editItemId: -1
							, excludeList: [ 'users' ]
						} 
					}
				}
			});
			
			modalInstance.result.then(function(item){
				if(APP_INFO.debug){
					console.info('$scope.createModalItemRelUserSettings#item: ', item);
				}
				$scope.item.relUserSettingses.push(item.item);
			}, function(){});
		};
		
		$scope.createModalItemUserRoles = function () {
			if(typeof $scope.item.userRoleses == "undefined"){
				$scope.item.userRoleses = [];
			}
		
			var modalInstance = $modal.open({
				templateUrl: 'UserrolesEdit',
				controller: 'UserRolesEditCtrl',
				resolve: {
					modalSettings: function () { 
						return { 
							  item: $scope.item
							, mode: "create"
							, isModal: true
							, isSimple: false
							, insertParent: true
							, editItem: {}
							, editItemId: -1
							, excludeList: [ 'users' ]
						} 
					}
				}
			});
			
			modalInstance.result.then(function(item){
				if(APP_INFO.debug){
					console.info('$scope.createModalItemUserRoles#item: ', item);
				}
				$scope.item.userRoleses.push(item.item);
			}, function(){});
		};
		

		/*---------------------------*/
		
		$scope.pickItemRelUserSettings = function () {
			var modalInstance = $modal.open({
				templateUrl: 'SettingsFragmentSelector',
				controller: 'SettingsSelectorCtrl',
				resolve: {
					item: function () { return $scope.selectedItem; }
				}
			});
			
			modalInstance.result.then(function (data) {
				$scope.item.relUserSettingses = APP.checkDublicate(
							$scope.item.relUserSettingses
						  , data.data
						  , 'settings'
						  , 'users'
						  , $scope.item
				);
				
			}, function(){});
		};
	
		$scope.pickItemUserRoles = function () {
			var modalInstance = $modal.open({
				templateUrl: 'UserrolesFragmentSelector',
				controller: 'UserRolesSelectorCtrl',
				resolve: {
					item: function () { return $scope.selectedItem; }
				}
			});
			
			modalInstance.result.then(function (data) {
				$scope.item.userRoleses = APP.checkDublicate2(
							$scope.item.userRoleses
						  , data.data
						  , 'UserRolesView'
				);
				
			}, function(){});
		};
	

		
}])

/*===========================*/


;