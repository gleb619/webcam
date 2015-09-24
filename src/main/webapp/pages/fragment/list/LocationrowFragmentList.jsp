<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordLocationRow" name="searchKeywordLocationRow"
							ng-model="searchKeywordLocationRow" class="form-control"
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
						<th ng-show="checkVisibility('locationsector')">
							<div ng-click="sort('locationsector')" >
								<a class="sortable-column-name"><span><spring:message code="label.locationSector" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.locationSector"></i>
								<i class="fa fa-caret-up" ng-hide="details.locationSector"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('quantity')">
							<div ng-click="sort('quantity')" >
								<a class="sortable-column-name"><span><spring:message code="label.quantity" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.quantity"></i>
								<i class="fa fa-caret-up" ng-hide="details.quantity"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('row')">
							<div ng-click="sort('row')" >
								<a class="sortable-column-name"><span><spring:message code="label.row" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.row"></i>
								<i class="fa fa-caret-up" ng-hide="details.row"></i>
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
							ng-repeat="item in filteredLocationRow = ( selectedItem.locationRows | filter:searchKeywordLocationRow )"
							ng-click="setSelected('selectedItemlocationRows', item, $index)"
							ng-class="{ 'success' : selectedItemlocationRows.id == item.id }">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('locationsector')"><label>{{ item.locationsector }}</label></td>
						<td ng-show="checkVisibility('quantity')"><label>{{ item.quantity }}</label></td>
						<td ng-show="checkVisibility('row')"><label>{{ item.row }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredLocationRow.length }}/{{ selectedItem.locationRows.length }}
				</div>
			  </div>
		</div>
	</div>
</div>