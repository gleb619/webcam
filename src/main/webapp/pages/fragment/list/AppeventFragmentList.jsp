<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordAppEvent" name="searchKeywordAppEvent"
							ng-model="searchKeywordAppEvent" class="form-control"
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

							<!--
							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
							-->
						</tr>
					</thead>
					<tbody>
						<tr
							ng-repeat="item in filteredAppEvent = ( selectedItem.appEvents | filter:searchKeywordAppEvent )"
							ng-click="setSelected('selectedItemappEvents', item, $index)"
							ng-class="{ 'success' : selectedItemappEvents.id == item.id }">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('isdeleted')" class="switch-td"><i ng-class="{'fa fa-lg fa-check': item.isDeleted, 'fa fa-lg fa-circle-o': !item.isDeleted}"></i></td>
						<td ng-show="checkVisibility('durationenddate')"><label>{{ item.durationenddate }}</label></td>
						<td ng-show="checkVisibility('durationstartdate')"><label>{{ item.durationstartdate }}</label></td>
						<td ng-show="checkVisibility('eventend')"><label>{{ item.eventEnd }}</label></td>
						<td ng-show="checkVisibility('canceltime')"><label>{{ item.cancelTime }}</label></td>
						<td ng-show="checkVisibility('eventstart')"><label>{{ item.eventStart }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredAppEvent.length }}/{{ selectedItem.appEvents.length }}
				</div>
			  </div>
		</div>
	</div>
</div>