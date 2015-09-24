<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div>
	<div class="row">
		<div class="padding-left-right-15">
			<div class="col-md-6 col-lg-6 without-padding">
				<div class="has-feedback searchBar">
					<input type="text" ng-model="searchKeywordLocationSector" class="form-control"
							placeholder="<spring:message code="default.searchKeyword" />"
							tabindex="1"  /> 
                	<i class="form-control-feedback glyphicon glyphicon-search"></i>
                </div>
			</div>
			<div class="btn-group col-md-6 col-lg-6 without-padding display-block toolbar-panel">
				<button type="button" 
						class="btn btn-default btn-create padding-top-2-bottom-4 
							   margin-left-0 col-xs-4 col-sm-4 col-md-4"
					ng-click="createModalItemLocationSector()">
					<i class="fa fa-file-o pull-left"></i>
					<i class="fa fa-file pull-left"></i>
					<spring:message code="default.create" />
				</button>
				<button type="button" 
					class="btn btn-default btn-edit padding-top-2-bottom-4 
						   margin-left-0 col-xs-4 col-sm-4 col-md-4"
					ng-click="editModalItemLocationSector(selectedItemlocationSectors.id)">
					<i class="glyphicon glyphicon-pencil pull-left"></i>
					<spring:message code="default.edit" />
				</button>
				<button type="button" 
					class="btn btn-default btn-delete padding-top-2-bottom-4 
						   margin-left-0 col-xs-4 col-sm-4 col-md-4"
					ng-click="deleteSubItem('locationSectors', 'LocationSector', selectedItemlocationSectors.id, itemIndex)">
					<i class="glyphicon glyphicon-trash pull-left"></i>
					<spring:message code="default.delete" />
				</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive margin-bottom-5 table-body ledit-scroll">
				<table class="table table-hover table-striped table-bordered 
							margin-bottom-5 padding-all-2">
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

							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in filteredLocationSector = ( item.locationSectors | filter:searchKeywordLocationSector )"
							ng-class="{ 'success' : selectedItemlocationSectors.id == item.id }"
							ng-dblclick="editModalItemLocationSector(item.id)"
							ng-click="setSelected('selectedItemlocationSectors', item, $index)">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('locationstadium')"><label>{{ item.locationstadium.label }}</label></td>
						<td ng-show="checkVisibility('quantity')"><label>{{ item.quantity }}</label></td>
						<td ng-show="checkVisibility('color')"><label>{{ item.color }}</label></td>
						<td ng-show="checkVisibility('name')"><label>{{ item.name }}</label></td>
						<td ng-show="checkVisibility('maplocation')"><label>{{ item.maplocation }}</label></td>
							<td>
								<a ng-click="editModalItemLocationSector(item.id)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon-pencil"></i> 
								</a>
							</td>
							<td>
								<a ng-click="deleteSubItem('locationSectors', 'LocationSector', item.id, $index)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ filteredLocationSector.length }}/{{ item.locationSectors.length }}
				</div>
			</div>
		</div>
	</div>
</div>