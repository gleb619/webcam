var complexTypes = {
	PhotoView:  [  ]
	, 	RelUserSettingsView:  [ { "text": "settings" }, { "text": "users" } ]
	, 	SettingsView:  [  ]
	, 	TmUserInfoView:  [  ]
	, 	UserRolesView:  [ { "text": "users" } ]
	, 	UsersView:  [  ]
}

function getComplexType(type) {
	return complexTypes[type];
}