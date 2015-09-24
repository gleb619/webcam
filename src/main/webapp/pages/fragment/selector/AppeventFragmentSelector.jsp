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
				<spring:message code="default.listof" /> <spring:message code="label.AppEvent" />
			<h4>
		</div>
		<div class="row modal-body padding-top-0">
			<div class="row">
			<c:if test="${debug}">
				<div class="col-md-12">
					<a href="../data/appeventview?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
						JSON DATA
					</a>
				</div>
			</c:if>
				<div class="col-md-12 filterBar">
					<div class="fill-content has-feedback modal-title">
						<input type="text" ng-model="searchKeywordAppEvent" class="form-control"
								placeholder="<spring:message code="default.filterKeyword" />"
								tabindex="1"  /> 
						<i class="form-control-feedback glyphicon glyphicon-search"></i>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="table-responsive margin-bottom-5 table-body ledit-scroll scrollable-content-500"
					when-scrolled="loadDataAppEvent()">
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
						<th ng-show="checkVisibility('isdeleted')">
							<div ng-click="sort('isdeleted')" >
								<a class="sortable-column-name"><span><spring:message code="label.isDeleted" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.isDeleted"></i>
								<i class="fa fa-caret-up" ng-hide="details.isDeleted"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('durationenddate')">
							<div ng-click="sort('durationenddate')" >
								<a class="sortable-column-name"><span><spring:message code="label.durationEndDate" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.durationEndDate"></i>
								<i class="fa fa-caret-up" ng-hide="details.durationEndDate"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('durationstartdate')">
							<div ng-click="sort('durationstartdate')" >
								<a class="sortable-column-name"><span><spring:message code="label.durationStartDate" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.durationStartDate"></i>
								<i class="fa fa-caret-up" ng-hide="details.durationStartDate"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('eventend')">
							<div ng-click="sort('eventend')" >
								<a class="sortable-column-name"><span><spring:message code="label.eventEnd" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.eventEnd"></i>
								<i class="fa fa-caret-up" ng-hide="details.eventEnd"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('canceltime')">
							<div ng-click="sort('canceltime')" >
								<a class="sortable-column-name"><span><spring:message code="label.cancelTime" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.cancelTime"></i>
								<i class="fa fa-caret-up" ng-hide="details.cancelTime"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('eventstart')">
							<div ng-click="sort('eventstart')" >
								<a class="sortable-column-name"><span><spring:message code="label.eventStart" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.eventStart"></i>
								<i class="fa fa-caret-up" ng-hide="details.eventStart"></i>
							</div>
						</th>

							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="item in filteredAppEvent = ( dataAppEvent | filter:searchKeywordAppEvent ) "
								ng-class="{ 'success' : item.checked }">
								<td class="picker-td"><input type="checkbox" ng-model="item.checked" ng-change="onSelectionChanged(item)" class="picker-input"/></td>
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('isdeleted')" class="switch-td"><i ng-class="{'fa fa-lg fa-check': item.isDeleted, 'fa fa-lg fa-circle-o': !item.isDeleted}"></i></td>
						<td ng-show="checkVisibility('durationenddate')"><label>{{ item.durationenddate }}</label></td>
						<td ng-show="checkVisibility('durationstartdate')"><label>{{ item.durationstartdate }}</label></td>
						<td ng-show="checkVisibility('eventend')"><label>{{ item.eventend }}</label></td>
						<td ng-show="checkVisibility('canceltime')"><label>{{ item.canceltime }}</label></td>
						<td ng-show="checkVisibility('eventstart')"><label>{{ item.eventstart }}</label></td>
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
							<span><spring:message code="default.total" />:{{ selectedItems.length }} / {{ filteredAppEvent.length }} / {{ dataAppEvent.length }}</span>
						</button>
						<button type="button" ng-disabled="scrollable.dataLoading"
							class="btn btn-primary" ng-click="loadDataAppEvent()">
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
