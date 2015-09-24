<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid" ng-controller="PhotoViewerCtrl">
	<div class="row" ng-if="!init">
		<div class="col-md-12 img-holder">
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 img-preview">
			<img class="img-responsive" ng-src="../images/{{ current.label }}">
			<!-- 
			<rg-slider
	            tracker-class="my-tracker rg-tracker-with-animation"
	            navigator-class="my-navigator"
	            ng-model="currentPosition"
	            track-var="trackPosition"
	            >
	        </rg-slider>
	        -->
	        <progressbar class="progress-striped active" value="trackPosition">
	        	<!-- <b>{{ trackPosition }}%</b> -->
	        </progressbar> 
		</div>
	</div>
	<div class="pull-left">
		currentPosition: {{ currentPosition }}&emsp;&emsp;/&emsp;&emsp;trackPosition: {{ trackPosition }}
	</div>
	<div class="pull-right">
		totalFrames: {{ totalFrames }}
	</div>
	<br>
	<hr>
	<br>
	<div class="row">
		<div class="btn-toolbar">
  			<div class="btn-group">
  				<button type="button" class="btn btn-default" ng-click="playOn()">
  					<span>Play</span>
  				</button>
  				<button type="button" class="btn btn-default" ng-click="pause()">
  					<span>Pause</span>
  				</button>
  				<button type="button" class="btn btn-default" ng-click="stop()">
  					<span>Stop</span>
  				</button>
  			</div>
  			<div class="btn-group">
  				<a type="button" class="btn btn-default" href="../images/{{ current }}" target="_blank">
  					<span>Download</span>
  				</a>
  			</div>
  			<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					<i class="fa-lg fa fa-play-circle-o"></i>
					<span>Speed</span> 
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a ng-click="speed = 1000">1x</a>
					</li>
					<li>
						<a ng-click="speed = 500">2x</a>
					</li>
					<li>
						<a ng-click="speed = 300">3x</a>
					</li>
					<li>
						<a ng-click="speed = 200">5x</a>
					</li>
					<li>
						<a ng-click="speed = 100">10x</a>
					</li>
				</ul>
  			</div>
  			<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					<i class="fa-lg fa fa-database"></i>
					<span>Load</span> 
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a >10 frames</a>
					</li>
					<li>
						<a >20 frames</a>
					</li>
					<li>
						<a >30 frames</a>
					</li>
				</ul>
  			</div>
  			<div class="btn-group">
  				<label>Repeat</label>
  				<input type="checkbox" ng-model="repeat">
			</div>		    
  			<c:if test="${debug}">
  			<div class="btn-group">
  				<div class="col-md-4">
  					<label class="control-label">Speed(ms)</label>
  				</div>
  				<div class="col-md-6">
  					<input type="text" ng-model="speed" class="form-control">
  				</div>
  			</div>
  			</c:if>
  		</div>
	</div>
	<div class="row">
		<br>

		<div class="input-group">
			<input type="text" class="form-control" placeholder="Image name" ng-model="current.label">
			<span class="input-group-btn" ng-click="current.label = '45ef8bcd-73b1-4e0b-bf1e-7cd7107b2421.jpeg'">
				<button class="btn btn-default" type="button">Test</button>
			</span>
		</div>
		<!-- 
		<input type="text" ng-model="current.label" class="form-control">
		<button type="button" class="btn btn-default" ng-click="current = '45ef8bcd-73b1-4e0b-bf1e-7cd7107b2421.jpeg'">
			<span>TEST</span>
		</button>
		-->
	</div>
	<c:if test="${debug}">
	<div class="row">
		dataPhoto: {{ dataPhoto.length }}
	</div>
	<div class="row">
		<div class="table-responsive">
			<table class="table table-hover table-striped table-bordered">
				<thead>
					<tr>
					<c:if test="${debug}">
						<th>id</th>
					</c:if>
						<th> <spring:message code="label.name" /> </th>
					</tr>
				</thead>
				<tbody>
					<!-- <tr ng-repeat="item in filteredPhoto = ( dataPhoto | filter:searchKeywordPhoto | orderBy: details.sortableColumn: details.sortableReverse )" -->
					<tr ng-repeat="item in dataPhoto track by item.id"
						ng-click="select(item)">
					<c:if test="${debug}">
						<td>{{ ::item.id }}</td>
					</c:if>
						<td><label>{{ ::item.name }}</label></td>
					</tr>
				</tbody>
			</table>
		  </div>
	</div>
	</c:if>
</div>