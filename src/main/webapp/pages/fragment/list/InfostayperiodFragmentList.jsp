<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordInfoStayPeriod" name="searchKeywordInfoStayPeriod"
							ng-model="searchKeywordInfoStayPeriod" class="form-control"
							placeholder="<spring:message code="default.searchKeyword" />"
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

							<!--
							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
							-->
						</tr>
					</thead>
					<tbody>
						<tr
							ng-repeat="item in filteredInfoStayPeriod = ( selectedItem.infoStayPeriods | filter:searchKeywordInfoStayPeriod )"
							ng-click="setSelected('selectedIteminfoStayPeriods', item, $index)"
							ng-class="{ 'success' : selectedIteminfoStayPeriods.id == item.id }">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('race')"><label>{{ item.race }}</label></td>
						<td ng-show="checkVisibility('departure')"><label>{{ item.departure }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredInfoStayPeriod.length }}/{{ selectedItem.infoStayPeriods.length }}
				</div>
			  </div>
		</div>
	</div>
</div>