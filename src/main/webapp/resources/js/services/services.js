'use strict';

angular.module('webcamApp.services', ['ngResource']) 

.factory('paymentPolyticDao', function ($resource) {
	var urls = {
		  obj: 					'..' + '/data/paymentpolytic/:id'
		, total: 				'..' + '/data/paymentpolytic/total'
		, view: 				'..' + '/data/paymentpolyticview/:id'
		, list: 				'..' + '/data/paymentpolytic/'
		, listview: 			'..' + '/data/paymentpolyticview/'
		, listScrollable: 		'..' + '/data/paymentpolytic/scrollable/'
		, listviewScrollable: 	'..' + '/data/paymentpolyticview/scrollable/'
	};

	return $resource(urls.listview, {}, {
		  showObj:   			{ method: 'GET' 		, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.obj			}
		, showView: 			{ method: 'GET'			, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.view		}
		, total: 				{ method: 'GET'			, params: { parametrs: '@parametrs' 									}	, url: urls.total		}
		, create: 				{ method: 'POST'																					, url: urls.list		}
		, update: 				{ method: 'PUT'   		  																			, url: urls.list		}
		, remove: 				{ method: 'DELETE'		, params: { id: '@id' } 													, url: urls.obj			}
		, list:  				{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.list 		}
		, listView:  			{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.listview	}
		, listScrollable:  		{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listScrollable  		}
		, listViewScrollable:  	{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listviewScrollable   	}
	});
})

.factory('photoDao', function ($resource) {
	var urls = {
		  obj: 					'..' + '/data/photo/:id'
		, total: 				'..' + '/data/photo/total'
		, view: 				'..' + '/data/photoview/:id'
		, list: 				'..' + '/data/photo/'
		, listview: 			'..' + '/data/photoview/'
		, listScrollable: 		'..' + '/data/photo/scrollable/'
		, listviewScrollable: 	'..' + '/data/photoview/scrollable/'
	};

	return $resource(urls.listview, {}, {
		  showObj:   			{ method: 'GET' 		, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.obj			}
		, showView: 			{ method: 'GET'			, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.view		}
		, total: 				{ method: 'GET'			, params: { parametrs: '@parametrs' 									}	, url: urls.total		}
		, create: 				{ method: 'POST'																					, url: urls.list		}
		, update: 				{ method: 'PUT'   		  																			, url: urls.list		}
		, remove: 				{ method: 'DELETE'		, params: { id: '@id' } 													, url: urls.obj			}
		, list:  				{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.list 		}
		, listView:  			{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.listview	}
		, listScrollable:  		{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listScrollable  		}
		, listViewScrollable:  	{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listviewScrollable   	}
	});
})

.factory('relUserSettingsDao', function ($resource) {
	var urls = {
		  obj: 					'..' + '/data/relusersettings/:id'
		, total: 				'..' + '/data/relusersettings/total'
		, view: 				'..' + '/data/relusersettingsview/:id'
		, list: 				'..' + '/data/relusersettings/'
		, listview: 			'..' + '/data/relusersettingsview/'
		, listScrollable: 		'..' + '/data/relusersettings/scrollable/'
		, listviewScrollable: 	'..' + '/data/relusersettingsview/scrollable/'
	};

	return $resource(urls.listview, {}, {
		  showObj:   			{ method: 'GET' 		, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.obj			}
		, showView: 			{ method: 'GET'			, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.view		}
		, total: 				{ method: 'GET'			, params: { parametrs: '@parametrs' 									}	, url: urls.total		}
		, create: 				{ method: 'POST'																					, url: urls.list		}
		, update: 				{ method: 'PUT'   		  																			, url: urls.list		}
		, remove: 				{ method: 'DELETE'		, params: { id: '@id' } 													, url: urls.obj			}
		, list:  				{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.list 		}
		, listView:  			{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.listview	}
		, listScrollable:  		{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listScrollable  		}
		, listViewScrollable:  	{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listviewScrollable   	}
	});
})

.factory('settingsDao', function ($resource) {
	var urls = {
		  obj: 					'..' + '/data/settings/:id'
		, total: 				'..' + '/data/settings/total'
		, view: 				'..' + '/data/settingsview/:id'
		, list: 				'..' + '/data/settings/'
		, listview: 			'..' + '/data/settingsview/'
		, listScrollable: 		'..' + '/data/settings/scrollable/'
		, listviewScrollable: 	'..' + '/data/settingsview/scrollable/'
	};

	return $resource(urls.listview, {}, {
		  showObj:   			{ method: 'GET' 		, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.obj			}
		, showView: 			{ method: 'GET'			, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.view		}
		, total: 				{ method: 'GET'			, params: { parametrs: '@parametrs' 									}	, url: urls.total		}
		, create: 				{ method: 'POST'																					, url: urls.list		}
		, update: 				{ method: 'PUT'   		  																			, url: urls.list		}
		, remove: 				{ method: 'DELETE'		, params: { id: '@id' } 													, url: urls.obj			}
		, list:  				{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.list 		}
		, listView:  			{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.listview	}
		, listScrollable:  		{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listScrollable  		}
		, listViewScrollable:  	{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listviewScrollable   	}
	});
})

.factory('sizedPolyticDao', function ($resource) {
	var urls = {
		  obj: 					'..' + '/data/sizedpolytic/:id'
		, total: 				'..' + '/data/sizedpolytic/total'
		, view: 				'..' + '/data/sizedpolyticview/:id'
		, list: 				'..' + '/data/sizedpolytic/'
		, listview: 			'..' + '/data/sizedpolyticview/'
		, listScrollable: 		'..' + '/data/sizedpolytic/scrollable/'
		, listviewScrollable: 	'..' + '/data/sizedpolyticview/scrollable/'
	};

	return $resource(urls.listview, {}, {
		  showObj:   			{ method: 'GET' 		, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.obj			}
		, showView: 			{ method: 'GET'			, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.view		}
		, total: 				{ method: 'GET'			, params: { parametrs: '@parametrs' 									}	, url: urls.total		}
		, create: 				{ method: 'POST'																					, url: urls.list		}
		, update: 				{ method: 'PUT'   		  																			, url: urls.list		}
		, remove: 				{ method: 'DELETE'		, params: { id: '@id' } 													, url: urls.obj			}
		, list:  				{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.list 		}
		, listView:  			{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.listview	}
		, listScrollable:  		{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listScrollable  		}
		, listViewScrollable:  	{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listviewScrollable   	}
	});
})

.factory('timedPolyticDao', function ($resource) {
	var urls = {
		  obj: 					'..' + '/data/timedpolytic/:id'
		, total: 				'..' + '/data/timedpolytic/total'
		, view: 				'..' + '/data/timedpolyticview/:id'
		, list: 				'..' + '/data/timedpolytic/'
		, listview: 			'..' + '/data/timedpolyticview/'
		, listScrollable: 		'..' + '/data/timedpolytic/scrollable/'
		, listviewScrollable: 	'..' + '/data/timedpolyticview/scrollable/'
	};

	return $resource(urls.listview, {}, {
		  showObj:   			{ method: 'GET' 		, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.obj			}
		, showView: 			{ method: 'GET'			, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.view		}
		, total: 				{ method: 'GET'			, params: { parametrs: '@parametrs' 									}	, url: urls.total		}
		, create: 				{ method: 'POST'																					, url: urls.list		}
		, update: 				{ method: 'PUT'   		  																			, url: urls.list		}
		, remove: 				{ method: 'DELETE'		, params: { id: '@id' } 													, url: urls.obj			}
		, list:  				{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.list 		}
		, listView:  			{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.listview	}
		, listScrollable:  		{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listScrollable  		}
		, listViewScrollable:  	{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listviewScrollable   	}
	});
})

.factory('tmUserInfoDao', function ($resource) {
	var urls = {
		  obj: 					'..' + '/data/tmuserinfo/:id'
		, total: 				'..' + '/data/tmuserinfo/total'
		, view: 				'..' + '/data/tmuserinfoview/:id'
		, list: 				'..' + '/data/tmuserinfo/'
		, listview: 			'..' + '/data/tmuserinfoview/'
		, listScrollable: 		'..' + '/data/tmuserinfo/scrollable/'
		, listviewScrollable: 	'..' + '/data/tmuserinfoview/scrollable/'
	};

	return $resource(urls.listview, {}, {
		  showObj:   			{ method: 'GET' 		, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.obj			}
		, showView: 			{ method: 'GET'			, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.view		}
		, total: 				{ method: 'GET'			, params: { parametrs: '@parametrs' 									}	, url: urls.total		}
		, create: 				{ method: 'POST'																					, url: urls.list		}
		, update: 				{ method: 'PUT'   		  																			, url: urls.list		}
		, remove: 				{ method: 'DELETE'		, params: { id: '@id' } 													, url: urls.obj			}
		, list:  				{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.list 		}
		, listView:  			{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.listview	}
		, listScrollable:  		{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listScrollable  		}
		, listViewScrollable:  	{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listviewScrollable   	}
	});
})

.factory('userRolesDao', function ($resource) {
	var urls = {
		  obj: 					'..' + '/data/userroles/:id'
		, total: 				'..' + '/data/userroles/total'
		, view: 				'..' + '/data/userrolesview/:id'
		, list: 				'..' + '/data/userroles/'
		, listview: 			'..' + '/data/userrolesview/'
		, listScrollable: 		'..' + '/data/userroles/scrollable/'
		, listviewScrollable: 	'..' + '/data/userrolesview/scrollable/'
	};

	return $resource(urls.listview, {}, {
		  showObj:   			{ method: 'GET' 		, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.obj			}
		, showView: 			{ method: 'GET'			, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.view		}
		, total: 				{ method: 'GET'			, params: { parametrs: '@parametrs' 									}	, url: urls.total		}
		, create: 				{ method: 'POST'																					, url: urls.list		}
		, update: 				{ method: 'PUT'   		  																			, url: urls.list		}
		, remove: 				{ method: 'DELETE'		, params: { id: '@id' } 													, url: urls.obj			}
		, list:  				{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.list 		}
		, listView:  			{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.listview	}
		, listScrollable:  		{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listScrollable  		}
		, listViewScrollable:  	{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listviewScrollable   	}
	});
})

.factory('usersDao', function ($resource) {
	var urls = {
		  obj: 					'..' + '/data/users/:id'
		, total: 				'..' + '/data/users/total'
		, view: 				'..' + '/data/usersview/:id'
		, list: 				'..' + '/data/users/'
		, listview: 			'..' + '/data/usersview/'
		, listScrollable: 		'..' + '/data/users/scrollable/'
		, listviewScrollable: 	'..' + '/data/usersview/scrollable/'
	};

	return $resource(urls.listview, {}, {
		  showObj:   			{ method: 'GET' 		, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.obj			}
		, showView: 			{ method: 'GET'			, params: { id: '@id', initDicts: '@initDicts', initLists: '@initLists' }	, url: urls.view		}
		, total: 				{ method: 'GET'			, params: { parametrs: '@parametrs' 									}	, url: urls.total		}
		, create: 				{ method: 'POST'																					, url: urls.list		}
		, update: 				{ method: 'PUT'   		  																			, url: urls.list		}
		, remove: 				{ method: 'DELETE'		, params: { id: '@id' } 													, url: urls.obj			}
		, list:  				{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.list 		}
		, listView:  			{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists' }				, url: urls.listview	}
		, listScrollable:  		{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listScrollable  		}
		, listViewScrollable:  	{ method: 'GET'			, params: { initDicts: '@initDicts', initLists: '@initLists', pageNumber: '@pageNumber', pageSize: '@pageSize' },	url: urls.listviewScrollable   	}
	});
})

.service('$servicesStorage', function (paymentPolyticDao, photoDao, relUserSettingsDao, settingsDao, sizedPolyticDao, timedPolyticDao, tmUserInfoDao, userRolesDao, usersDao) {
	return {
		PaymentPolyticDao: function() {
			return paymentPolyticDao;
		}
		, PhotoDao: function() {
			return photoDao;
		}
		, RelUserSettingsDao: function() {
			return relUserSettingsDao;
		}
		, SettingsDao: function() {
			return settingsDao;
		}
		, SizedPolyticDao: function() {
			return sizedPolyticDao;
		}
		, TimedPolyticDao: function() {
			return timedPolyticDao;
		}
		, TmUserInfoDao: function() {
			return tmUserInfoDao;
		}
		, UserRolesDao: function() {
			return userRolesDao;
		}
		, UsersDao: function() {
			return usersDao;
		}

	};
});

