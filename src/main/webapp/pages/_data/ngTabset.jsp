<div class="tabset">
	<ul class="nav nav-{{type || 'tabs'}}" ng-class="{'nav-stacked': vertical, 'nav-justified': justified}" ng-transclude></ul>
	<div class="tab-content">
		<div class="tab-pane" ng-repeat="tab in tabs" ng-class="{active: tab.active}" tab-content-transclude="tab"></div>
	</div>
</div>