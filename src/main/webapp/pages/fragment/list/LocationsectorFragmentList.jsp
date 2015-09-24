<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordLocationSector" name="searchKeywordLocationSector"
							ng-model="searchKeywordLocationSector" class="form-control"
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

							<!--
							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
							-->
						</tr>
					</thead>
					<tbody>
						<tr
							ng-repeat="item in filteredLocationSector = ( selectedItem.locationSectors | filter:searchKeywordLocationSector )"
							ng-click="setSelected('selectedItemlocationSectors', item, $index)"
							ng-class="{ 'success' : selectedItemlocationSectors.id == item.id }">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('locationstadium')"><label>{{ item.locationstadium }}</label></td>
						<td ng-show="checkVisibility('quantity')"><label>{{ item.quantity }}</label></td>
						<td ng-show="checkVisibility('color')"><label>{{ item.color }}</label></td>
						<td ng-show="checkVisibility('name')"><label>{{ item.name }}</label></td>
						<td ng-show="checkVisibility('maplocation')"><label>{{ item.mapLocation }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredLocationSector.length }}/{{ selectedItem.locationSectors.length }}
				</div>
			  </div>
		</div>
	</div>
</div>