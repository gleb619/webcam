<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordTransferRoute" name="searchKeywordTransferRoute"
							ng-model="searchKeywordTransferRoute" class="form-control"
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

							<!--
							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
							-->
						</tr>
					</thead>
					<tbody>
						<tr
							ng-repeat="item in filteredTransferRoute = ( selectedItem.transferRoutes | filter:searchKeywordTransferRoute )"
							ng-click="setSelected('selectedItemtransferRoutes', item, $index)"
							ng-class="{ 'success' : selectedItemtransferRoutes.id == item.id }">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('fixedallowance')"><label>{{ item.fixedallowance }}</label></td>
						<td ng-show="checkVisibility('percentageofallowances')"><label>{{ item.percentageofallowances }}</label></td>
						<td ng-show="checkVisibility('free')" class="switch-td"><i ng-class="{'fa fa-lg fa-check': item.free, 'fa fa-lg fa-circle-o': !item.free}"></i></td>
						<td ng-show="checkVisibility('currcurrency')"><label>{{ item.currcurrency }}</label></td>
						<td ng-show="checkVisibility('sum')"><label>{{ item.sum }}</label></td>
						<td ng-show="checkVisibility('driver')"><label>{{ item.driver }}</label></td>
						<td ng-show="checkVisibility('driverphone')"><label>{{ item.driverPhone }}</label></td>
						<td ng-show="checkVisibility('descr')"><label>{{ item.descr }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredTransferRoute.length }}/{{ selectedItem.transferRoutes.length }}
				</div>
			  </div>
		</div>
	</div>
</div>