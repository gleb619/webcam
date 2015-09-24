'use strict';

angular.module('webcamApp', [
	  'ngRoute'        
	, 'ngSanitize'     
	, 'ngStorage' 
	, 'toaster' 
  	, 'ui.bootstrap'
  	, 'rangeSlider'
// 	, 'angular.filter'
  	, 'webcamApp.filters'
  	, 'webcamApp.services'
  	, 'webcamApp.services.static'
  	, 'webcamApp.controllers'
  	, 'webcamApp.controllers.static'
  	, 'webcamApp.directives'
// 	, 'ui.tinymce'
// 	, 'textAngular'
//  	, 'angularFileUpload'
])
.config(function ($routeProvider, $httpProvider) {

	$routeProvider.when('/', 						{ templateUrl: 'native_client' });
	$routeProvider.when('/landscape_detail/:id',	{ templateUrl: 'landscape_detail' });
	$routeProvider.when('/all_modules', 			{ templateUrl: 'all_modules' });
	$routeProvider.when('/layout_3', 				{ templateUrl: 'layout_3' });
	$routeProvider.when('/standart_layout', 		{ templateUrl: 'standart_layout' });
	$routeProvider.when('/standart_payment', 		{ templateUrl: 'standart_payment' });
	$routeProvider.when('/standart_services', 		{ templateUrl: 'standart_services' });
	$routeProvider.when('/hello', 					{ templateUrl: 'hello'			, controller: 'IndexCtrl' });
	$routeProvider.when('/shop_landscape', 			{ templateUrl: 'shop_landscape' });
	$routeProvider.when('/shophotel-big', 			{ templateUrl: 'shophotel-big' });
	$routeProvider.when('/shophotel-medium',		{ templateUrl: 'shophotel-medium' });
	$routeProvider.when('/shophotel-small', 		{ templateUrl: 'shophotel-small' });
	$routeProvider.when('/shophotel-small-2', 		{ templateUrl: 'shophotel-small-2' });
	$routeProvider.when('/servhotelDetail', 		{ templateUrl: 'servhotelDetail' });
	$routeProvider.when('/dict', 					{ templateUrl: 'dict' });
	$routeProvider.when('/help', 					{ templateUrl: 'help' });
	$routeProvider.when('/upload', 					{ templateUrl: 'upload' });
	$routeProvider.when('/upload2', 				{ templateUrl: 'upload2' });
	$routeProvider.when('/logs', 					{ templateUrl: 'logs'			, controller: 'LogsListCtrl' });
	$routeProvider.when('/timeline', 				{ templateUrl: 'timeline'		, controller: 'TimelineCtrl' });
	$routeProvider.when('/gantt', 					{ templateUrl: 'gantt'			, controller: 'GanttCtrl' });
	$routeProvider.when('/localization', 			{ templateUrl: 'localization'	, controller: 'LocalizationListCtrl' });

	$routeProvider.when('/PhotoList', {templateUrl: 'PhotoList', controller: 'PhotoListCtrl'	});
	$routeProvider.when('/PhotoEdit/:id', {templateUrl: 'PhotoEdit', controller: 'PhotoEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'photo' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/PhotoCreate', {templateUrl: 'PhotoEdit', controller: 'PhotoEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'photo' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/RelusersettingsList', {templateUrl: 'RelusersettingsList', controller: 'RelUserSettingsListCtrl'	});
	$routeProvider.when('/RelusersettingsEdit/:id', {templateUrl: 'RelusersettingsEdit', controller: 'RelUserSettingsEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'relusersettings' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/RelusersettingsCreate', {templateUrl: 'RelusersettingsEdit', controller: 'RelUserSettingsEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'relusersettings' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/SettingsList', {templateUrl: 'SettingsList', controller: 'SettingsListCtrl'	});
	$routeProvider.when('/SettingsEdit/:id', {templateUrl: 'SettingsEdit', controller: 'SettingsEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'settings' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/SettingsCreate', {templateUrl: 'SettingsEdit', controller: 'SettingsEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'settings' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/TmuserinfoList', {templateUrl: 'TmuserinfoList', controller: 'TmUserInfoListCtrl'	});
	$routeProvider.when('/TmuserinfoEdit/:id', {templateUrl: 'TmuserinfoEdit', controller: 'TmUserInfoEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'tmuserinfo' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/TmuserinfoCreate', {templateUrl: 'TmuserinfoEdit', controller: 'TmUserInfoEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'tmuserinfo' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/UserrolesList', {templateUrl: 'UserrolesList', controller: 'UserRolesListCtrl'	});
	$routeProvider.when('/UserrolesEdit/:id', {templateUrl: 'UserrolesEdit', controller: 'UserRolesEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'userroles' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/UserrolesCreate', {templateUrl: 'UserrolesEdit', controller: 'UserRolesEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'userroles' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/UsersList', {templateUrl: 'UsersList', controller: 'UsersListCtrl'	});
	$routeProvider.when('/UsersEdit/:id', {templateUrl: 'UsersEdit', controller: 'UsersEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'users' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/UsersCreate', {templateUrl: 'UsersEdit', controller: 'UsersEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'users' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/PhotoviewList', {templateUrl: 'PhotoviewList', controller: 'PhotoViewListCtrl'	});
	$routeProvider.when('/PhotoviewEdit/:id', {templateUrl: 'PhotoviewEdit', controller: 'PhotoViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'photoview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/PhotoviewCreate', {templateUrl: 'PhotoviewEdit', controller: 'PhotoViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'photoview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/RelusersettingsviewList', {templateUrl: 'RelusersettingsviewList', controller: 'RelUserSettingsViewListCtrl'	});
	$routeProvider.when('/RelusersettingsviewEdit/:id', {templateUrl: 'RelusersettingsviewEdit', controller: 'RelUserSettingsViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'relusersettingsview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/RelusersettingsviewCreate', {templateUrl: 'RelusersettingsviewEdit', controller: 'RelUserSettingsViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'relusersettingsview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/SettingsviewList', {templateUrl: 'SettingsviewList', controller: 'SettingsViewListCtrl'	});
	$routeProvider.when('/SettingsviewEdit/:id', {templateUrl: 'SettingsviewEdit', controller: 'SettingsViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'settingsview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/SettingsviewCreate', {templateUrl: 'SettingsviewEdit', controller: 'SettingsViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'settingsview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/TmuserinfoviewList', {templateUrl: 'TmuserinfoviewList', controller: 'TmUserInfoViewListCtrl'	});
	$routeProvider.when('/TmuserinfoviewEdit/:id', {templateUrl: 'TmuserinfoviewEdit', controller: 'TmUserInfoViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'tmuserinfoview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/TmuserinfoviewCreate', {templateUrl: 'TmuserinfoviewEdit', controller: 'TmUserInfoViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'tmuserinfoview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/UserrolesviewList', {templateUrl: 'UserrolesviewList', controller: 'UserRolesViewListCtrl'	});
	$routeProvider.when('/UserrolesviewEdit/:id', {templateUrl: 'UserrolesviewEdit', controller: 'UserRolesViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'userrolesview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/UserrolesviewCreate', {templateUrl: 'UserrolesviewEdit', controller: 'UserRolesViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'userrolesview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/UsersviewList', {templateUrl: 'UsersviewList', controller: 'UsersViewListCtrl'	});
	$routeProvider.when('/UsersviewEdit/:id', {templateUrl: 'UsersviewEdit', controller: 'UsersViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "edit"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'usersview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	$routeProvider.when('/UsersviewCreate', {templateUrl: 'UsersviewEdit', controller: 'UsersViewEditCtrl',
		resolve: { 
			modalSettings: function(){ 
				return {
					  mode: "create"
					, isModal: false
					, editItem: {}
					, editItemId: -1
					, excludeList: [ 'usersview' ]
				}; 
			}
			, $modalInstance: function() {
				return {};
			}
		}  
	});
	
	$routeProvider.when('/:name', { 
		templateUrl: function(params) { 
			return params.name; 
		}
	});
	
	$routeProvider.otherwise({ redirectTo: '/' });

	$httpProvider.interceptors.push(function ($q, $rootScope, $location, toaster) {
        return {
        	request: function(request) {
//        		console.info('request: ', request);
        	
				return request;
			}
        	, response: function(response) { 
//        		console.info('response: ', response);
        	
        		if (typeof response.data === 'string') {
                    if (response.data.indexOf instanceof Function && response.data.indexOf('<body id="loginpage0"') != -1) {
                    	window.location.replace("../login?logout");
                    }
                }
        		
        		return response;
        	}
            , responseError: function(rejection) {
        		console.info('rejection: ', rejection);
        		
        		var status = rejection.status;
        		var config = rejection.config;
        		var method = config.method;
        		var url = config.url;
      
				toaster.pop('error', "An error has occurred", method + " on " + url + " failed with status " + status);
              
        		return $q.reject(rejection);
        	}
        };
	});

//	$httpProvider.defaults.cache = false;

	$httpProvider.defaults.useXDomain = true;
	$httpProvider.defaults.withCredentials = true;
	delete $httpProvider.defaults.headers.common["X-Requested-With"];
	$httpProvider.defaults.headers.common["Accept"] = "application/json";
	$httpProvider.defaults.headers.common["Content-Type"] = "application/json";
  
})
.constant("APP_INFO", {
      name: "webcam-crm"
    , version: "1.0.0.1"
    , simple_version: 0.12
    , debug: false
    , prefix: "webcam"
});

