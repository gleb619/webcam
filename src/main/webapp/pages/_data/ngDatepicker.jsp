<div ng-switch="datepickerMode" role="application" ng-keydown="keydown($event)">
	<daypicker ng-switch-when="day" tabindex="0"></daypicker>
	<monthpicker ng-switch-when="month" tabindex="0"></monthpicker>
	<yearpicker ng-switch-when="year" tabindex="0"></yearpicker>
</div>