<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="edit-form">
	<div ng-hide="loading">
		<div class="modal-header">
			<div class="row">
				<div class="col-xs-10 filterBar">
					<div class="fill-content has-feedback modal-title">
						<input type="text" ng-model="searchKeywordInfoStayPeriod" class="form-control"
								placeholder="<spring:message code="default.searchKeyword" />"
								tabindex="1"  /> 
						<i class="form-control-feedback glyphicon glyphicon-search"></i>
					</div>
				</div>
				<c:if test="${debug}">
					<div class="col-xs-2">
						<button type="button" class="close round-button" ng-click="cancel()">&times;</button>
						<a href="../data/infostayperiod/{{ item.id }}" target="_blank" class="btn btn-default">
							JSON DATA
						</a>
					</div>
				</c:if>
			</div>
		</div>
		<div class="row modal-body padding-top-0">
			<div class="col-md-12">
				<div class="table-responsive margin-bottom-5 table-body ledit-scroll scrollable-content-500"
					when-scrolled="loadDataInfoStayPeriod()">
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
						<th ng-show="checkVisibility('race')">
							<div ng-click="sort('race')" >
								<a class="sortable-column-name"><span><spring:message code="label.race" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.race"></i>
								<i class="fa fa-caret-up" ng-hide="details.race"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('departure')">
							<div ng-click="sort('departure')" >
								<a class="sortable-column-name"><span><spring:message code="label.departure" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.departure"></i>
								<i class="fa fa-caret-up" ng-hide="details.departure"></i>
							</div>
						</th>

							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="item in filteredInfoStayPeriod = ( dataInfoStayPeriod | filter:searchKeywordInfoStayPeriod ) "
								ng-class="{ 'success' : item.checked }">
								<td class="picker-td"><input type="checkbox" ng-model="item.checked" ng-change="onSelectionChanged(item)" class="picker-input"/></td>
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('race')"><label>{{ item.race }}</label></td>
						<td ng-show="checkVisibility('departure')"><label>{{ item.departure }}</label></td>
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
							<span><spring:message code="default.total" />:{{ selectedItems.length }} / {{ filteredInfoStayPeriod.length }} / {{ dataInfoStayPeriod.length }}</span>
						</button>
						<button type="button" ng-disabled="scrollable.dataLoading"
							class="btn btn-primary" ng-click="loadDataInfoStayPeriod()">
							<i class="fa fa-database fa-lg" ng-hide="scrollable.dataLoading"></i>
							<i class="fa fa-refresh fa-lg fa-spin" ng-show="scrollable.dataLoading"></i>
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
