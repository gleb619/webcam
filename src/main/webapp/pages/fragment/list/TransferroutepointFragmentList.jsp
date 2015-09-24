<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordTransferRoutePoint" name="searchKeywordTransferRoutePoint"
							ng-model="searchKeywordTransferRoutePoint" class="form-control"
							placeholder="<spring:message code="default.filterKeyword" />"
							tabindex="1"  /> 
                	<i class="form-control-feedback glyphicon glyphicon-search"></i>
                </div>
			</div>
			<div class="col-md-12">
			  <div class="table-responsive">
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<tr>
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
						<th ng-show="checkVisibility('starton')">
							<div ng-click="sort('starton')" >
								<a class="sortable-column-name"><span><spring:message code="label.startOn" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.startOn"></i>
								<i class="fa fa-caret-up" ng-hide="details.startOn"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('transferroute')">
							<div ng-click="sort('transferroute')" >
								<a class="sortable-column-name"><span><spring:message code="label.transferRoute" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.transferRoute"></i>
								<i class="fa fa-caret-up" ng-hide="details.transferRoute"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('sum')">
							<div ng-click="sort('sum')" >
								<a class="sortable-column-name"><span><spring:message code="label.sum" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.sum"></i>
								<i class="fa fa-caret-up" ng-hide="details.sum"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('pointfrom')">
							<div ng-click="sort('pointfrom')" >
								<a class="sortable-column-name"><span><spring:message code="label.pointFrom" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.pointFrom"></i>
								<i class="fa fa-caret-up" ng-hide="details.pointFrom"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('pointto')">
							<div ng-click="sort('pointto')" >
								<a class="sortable-column-name"><span><spring:message code="label.pointTo" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.pointTo"></i>
								<i class="fa fa-caret-up" ng-hide="details.pointTo"></i>
							</div>
						</th>

							<!--
							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
							-->
						</tr>
					</thead>
					<tbody>
						<tr
							ng-repeat="item in filteredTransferRoutePoint = ( selectedItem.transferRoutePoints | filter:searchKeywordTransferRoutePoint )"
							ng-click="setSelected('selectedItemtransferRoutePoints', item, $index)"
							ng-class="{ 'success' : selectedItemtransferRoutePoints.id == item.id }">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('fixedallowance')"><label>{{ item.fixedallowance }}</label></td>
						<td ng-show="checkVisibility('percentageofallowances')"><label>{{ item.percentageofallowances }}</label></td>
						<td ng-show="checkVisibility('free')" class="switch-td"><i ng-class="{'fa fa-lg fa-check': item.free, 'fa fa-lg fa-circle-o': !item.free}"></i></td>
						<td ng-show="checkVisibility('starton')"><label>{{ item.starton }}</label></td>
						<td ng-show="checkVisibility('transferroute')"><label>{{ item.transferroute }}</label></td>
						<td ng-show="checkVisibility('sum')"><label>{{ item.sum }}</label></td>
						<td ng-show="checkVisibility('pointfrom')"><label>{{ item.pointFrom }}</label></td>
						<td ng-show="checkVisibility('pointto')"><label>{{ item.pointTo }}</label></td>
							<!--
							<td>
								<a ng-click="editItem(item.id)" class="btn btn-lg">
									<i class="glyphicon glyphicons-lg glyphicon-pencil"></i> 
								</a>
							</td>
							<td>
								<a ng-click="deleteItem(item.id)" class="btn btn-lg">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
							-->
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ filteredTransferRoutePoint.length }}/{{ selectedItem.transferRoutePoints.length }}
				</div>
			  </div>
		</div>
	</div>
</div>