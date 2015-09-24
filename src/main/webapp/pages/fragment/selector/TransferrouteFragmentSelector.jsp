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
				<spring:message code="default.listof" /> <spring:message code="label.TransferRoute" />
			<h4>
		</div>
		<div class="row modal-body padding-top-0">
			<div class="row">
			<c:if test="${debug}">
				<div class="col-md-12">
					<a href="../data/transferrouteview?initLists=true&initDicts=true" target="_blank" class="btn btn-default">
						JSON DATA
					</a>
				</div>
			</c:if>
				<div class="col-md-12 filterBar">
					<div class="fill-content has-feedback modal-title">
						<input type="text" ng-model="searchKeywordTransferRoute" class="form-control"
								placeholder="<spring:message code="default.filterKeyword" />"
								tabindex="1"  /> 
						<i class="form-control-feedback glyphicon glyphicon-search"></i>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="table-responsive margin-bottom-5 table-body ledit-scroll scrollable-content-500"
					when-scrolled="loadDataTransferRoute()">
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
						<th ng-show="checkVisibility('fixedallowance')">
							<div ng-click="sort('fixedallowance')" >
								<a class="sortable-column-name"><span><spring:message code="label.fixedAllowance" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.fixedAllowance"></i>
								<i class="fa fa-caret-up" ng-hide="details.fixedAllowance"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('percentageofallowances')">
							<div ng-click="sort('percentageofallowances')" >
								<a class="sortable-column-name"><span><spring:message code="label.percentageOfAllowances" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.percentageOfAllowances"></i>
								<i class="fa fa-caret-up" ng-hide="details.percentageOfAllowances"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('free')">
							<div ng-click="sort('free')" >
								<a class="sortable-column-name"><span><spring:message code="label.free" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.free"></i>
								<i class="fa fa-caret-up" ng-hide="details.free"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('currcurrency')">
							<div ng-click="sort('currcurrency')" >
								<a class="sortable-column-name"><span><spring:message code="label.currCurrency" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.currCurrency"></i>
								<i class="fa fa-caret-up" ng-hide="details.currCurrency"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('sum')">
							<div ng-click="sort('sum')" >
								<a class="sortable-column-name"><span><spring:message code="label.sum" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.sum"></i>
								<i class="fa fa-caret-up" ng-hide="details.sum"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('driver')">
							<div ng-click="sort('driver')" >
								<a class="sortable-column-name"><span><spring:message code="label.driver" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.driver"></i>
								<i class="fa fa-caret-up" ng-hide="details.driver"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('driverphone')">
							<div ng-click="sort('driverphone')" >
								<a class="sortable-column-name"><span><spring:message code="label.driverPhone" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.driverPhone"></i>
								<i class="fa fa-caret-up" ng-hide="details.driverPhone"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('descr')">
							<div ng-click="sort('descr')" >
								<a class="sortable-column-name"><span><spring:message code="label.descr" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.descr"></i>
								<i class="fa fa-caret-up" ng-hide="details.descr"></i>
							</div>
						</th>

							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="item in filteredTransferRoute = ( dataTransferRoute | filter:searchKeywordTransferRoute ) "
								ng-class="{ 'success' : item.checked }">
								<td class="picker-td"><input type="checkbox" ng-model="item.checked" ng-change="onSelectionChanged(item)" class="picker-input"/></td>
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('fixedallowance')"><label>{{ item.fixedallowance }}</label></td>
						<td ng-show="checkVisibility('percentageofallowances')"><label>{{ item.percentageofallowances }}</label></td>
						<td ng-show="checkVisibility('free')" class="switch-td"><i ng-class="{'fa fa-lg fa-check': item.free, 'fa fa-lg fa-circle-o': !item.free}"></i></td>
						<td ng-show="checkVisibility('currcurrency')"><label>{{ item.currcurrency }}</label></td>
						<td ng-show="checkVisibility('sum')"><label>{{ item.sum }}</label></td>
						<td ng-show="checkVisibility('driver')"><label>{{ item.driver }}</label></td>
						<td ng-show="checkVisibility('driverphone')"><label>{{ item.driverphone }}</label></td>
						<td ng-show="checkVisibility('descr')"><label>{{ item.descr }}</label></td>
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
							<span><spring:message code="default.total" />:{{ selectedItems.length }} / {{ filteredTransferRoute.length }} / {{ dataTransferRoute.length }}</span>
						</button>
						<button type="button" ng-disabled="scrollable.dataLoading"
							class="btn btn-primary" ng-click="loadDataTransferRoute()">
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
