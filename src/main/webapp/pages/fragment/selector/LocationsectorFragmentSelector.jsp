<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="edit-form">
	<div ng-hide="loading">
		<div class="modal-header">
			<button type="button" class="close round-button" ng-click="cancel()">&times;</button>
			<h4 class="modal-title">
				<spring:message code="default.listof" /> <spring:message code="label.LocationSector" />
			<h4>
		</div>
		<div class="row modal-body padding-top-0">
			<div class="row">
			<c:if test="${debug}">
				<div class="col-md-12">
					<a href="../data/locationsectorview?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
						JSON DATA
					</a>
				</div>
			</c:if>
				<div class="col-md-12 filterBar">
					<div class="fill-content has-feedback modal-title">
						<input type="text" ng-model="searchKeywordLocationSector" class="form-control"
								placeholder="<spring:message code="default.filterKeyword" />"
								tabindex="1"  /> 
						<i class="form-control-feedback glyphicon glyphicon-search"></i>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="table-responsive margin-bottom-5 table-body ledit-scroll scrollable-content-500"
					when-scrolled="loadDataLocationSector()">
					<table class="table table-hover table-striped table-bordered
							margin-bottom-5 padding-all-2">
						<thead>
							<tr>
								<th class="picker-th"></th>
						<th ng-show="checkVisibility('label')">
							<div ng-click="sort('label')" >
								<a class="sortable-column-name"><span><spring:message code="label.label" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.label"></i>
								<i class="fa fa-caret-up" ng-hide="details.label"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('locationstadium')">
							<div ng-click="sort('locationstadium')" >
								<a class="sortable-column-name"><span><spring:message code="label.locationStadium" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.locationStadium"></i>
								<i class="fa fa-caret-up" ng-hide="details.locationStadium"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('quantity')">
							<div ng-click="sort('quantity')" >
								<a class="sortable-column-name"><span><spring:message code="label.quantity" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.quantity"></i>
								<i class="fa fa-caret-up" ng-hide="details.quantity"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('color')">
							<div ng-click="sort('color')" >
								<a class="sortable-column-name"><span><spring:message code="label.color" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.color"></i>
								<i class="fa fa-caret-up" ng-hide="details.color"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('name')">
							<div ng-click="sort('name')" >
								<a class="sortable-column-name"><span><spring:message code="label.name" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.name"></i>
								<i class="fa fa-caret-up" ng-hide="details.name"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('maplocation')">
							<div ng-click="sort('maplocation')" >
								<a class="sortable-column-name"><span><spring:message code="label.mapLocation" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.mapLocation"></i>
								<i class="fa fa-caret-up" ng-hide="details.mapLocation"></i>
							</div>
						</th>

							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="item in filteredLocationSector = ( dataLocationSector | filter:searchKeywordLocationSector ) "
								ng-class="{ 'success' : item.checked }">
								<td class="picker-td"><input type="checkbox" ng-model="item.checked" ng-change="onSelectionChanged(item)" class="picker-input"/></td>
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('locationstadium')"><label>{{ item.locationstadium }}</label></td>
						<td ng-show="checkVisibility('quantity')"><label>{{ item.quantity }}</label></td>
						<td ng-show="checkVisibility('color')"><label>{{ item.color }}</label></td>
						<td ng-show="checkVisibility('name')"><label>{{ item.name }}</label></td>
						<td ng-show="checkVisibility('maplocation')"><label>{{ item.maplocation }}</label></td>
							</tr>
						</tbody>
					</table>
				  </div>
			</div>
			<div class="col-md-12 margin-bottom-10">
				<div class="btn-toolbar">
	  				<div class="btn-group">
						<button type="button" class="btn btn-default">
							<i class="fa fa-list-alt fa-lg"></i>
							<span><spring:message code="default.total" />:{{ selectedItems.length }} / {{ filteredLocationSector.length }} / {{ dataLocationSector.length }}</span>
						</button>
						<button type="button" ng-disabled="scrollable.dataLoading"
							class="btn btn-primary" ng-click="loadDataLocationSector()">
							<i class="fa fa-database fa-lg" ng-class="{'fa-refresh fa-spin': scrollable.dataLoading, 'fa-database': !scrollable.dataLoading}"></i>
							<span><spring:message code="default.loadMore" /></span>
						</button>
	  				</div>
	  			</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="col-xs-6 col-md-6">
				<a ng-click="cancel()" class="btn btn-default btn-block btn-lg">
					<spring:message code="default.cancel" />
				</a>
			</div>
			<div class="col-xs-6 col-md-6">
				<a ng-click="submitFunc()"
					class="btn btn-success btn-block btn-lg"> <spring:message
						code="default.submit" />
				</a>
			</div>
		</div>
	</div>
	 <div ng-show="loading" ng-class="{ 'border-none': loading }" class="loading-bar-holder">
		<div class="loading-bar">
			<i class="glyphicon glyphicon-refresh fa-spin loading-spinner"></i>
		</div>
	</div>
</div>
