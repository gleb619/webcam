<div class="alert"
	ng-class="['alert-' + (type || 'warning'), closeable ? 'alert-dismissable' : null]"
	role="alert">
	<button ng-show="closeable" type="button" class="close"
		ng-click="close()">
		<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
	</button>
	<div ng-transclude></div>
</div>
