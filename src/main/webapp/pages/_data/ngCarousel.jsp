<div ng-mouseenter="pause()" 
	ng-mouseleave="play()" 
	class="carousel" 
	ng-swipe-right="prev()" 
	ng-swipe-left="next()">
    <ol class="carousel-indicators" ng-show="slides.length > 1">
        <li ng-repeat="slide in slides track by $index" 
        	ng-class="{active: isActive(slide)}" 
        	ng-click="select(slide)">
        </li>
    </ol>
    <div class="carousel-inner" ng-transclude></div>
    <a class="left carousel-control" ng-click="prev()" ng-show="slides.length > 1">
    	<span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" ng-click="next()" ng-show="slides.length > 1">
    	<span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>