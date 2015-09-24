<div class="panel panel-default">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" ng-click="toggleOpen()"
				accordion-transclude="heading">
				<span ng-class="{'text-muted': isDisabled}">{{heading}}</span>
			</a>
		</h4>
	</div>
	<div class="panel-collapse" collapse="!isOpen">
		<div class="panel-body" ng-transclude></div>
	</div>
</div>