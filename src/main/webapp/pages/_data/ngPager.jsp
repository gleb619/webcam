<ul class="pager">
	<li ng-class="{disabled: noPrevious(), previous: align}"><a href ng-click="selectPage(page - 1)">{{getText('previous')}}</a></li>
	<li ng-class="{disabled: noNext(), next: align}"><a href ng-click="selectPage(page + 1)">{{getText('next')}}</a></li>
</ul>