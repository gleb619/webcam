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
					<input type="text" ng-model="searchKeywordLocationSeat" class="form-control"
							placeholder="<spring:message code="default.searchKeyword" />"
							tabindex="1"  /> 
                	<i class="form-control-feedback glyphicon glyphicon-search"></i>
                </div>
			</div>
			<div class="btn-group col-md-6 col-lg-6 without-padding display-block toolbar-panel">
				<button type="button" 
						class="btn btn-default btn-create padding-top-2-bottom-4 
							   margin-left-0 col-xs-4 col-sm-4 col-md-4"
					ng-click="createModalItemLocationSeat()">
					<i class="fa fa-file-o pull-left"></i>
					<i class="fa fa-file pull-left"></i>
					<spring:message code="default.create" />
				</button>
				<button type="button" 
					class="btn btn-default btn-edit padding-top-2-bottom-4 
						   margin-left-0 col-xs-4 col-sm-4 col-md-4"
					ng-click="editModalItemLocationSeat(selectedItemlocationSeats.id)">
					<i class="glyphicon glyphicon-pencil pull-left"></i>
					<spring:message code="default.edit" />
				</button>
				<button type="button" 
					class="btn btn-default btn-delete padding-top-2-bottom-4 
						   margin-left-0 col-xs-4 col-sm-4 col-md-4"
					ng-click="deleteSubItem('locationSeats', 'LocationSeat', selectedItemlocationSeats.id, itemIndex)">
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
						<th ng-show="checkVisibility('locationrow')">
							<div ng-click="sort('locationrow')" >
								<a class="sortable-column-name"><span><spring:message code="label.locationRow" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.locationRow"></i>
								<i class="fa fa-caret-up" ng-hide="details.locationRow"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('seat')">
							<div ng-click="sort('seat')" >
								<a class="sortable-column-name"><span><spring:message code="label.seat" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.seat"></i>
								<i class="fa fa-caret-up" ng-hide="details.seat"></i>
							</div>
						</th>

							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in filteredLocationSeat = ( item.locationSeats | filter:searchKeywordLocationSeat )"
							ng-class="{ 'success' : selectedItemlocationSeats.id == item.id }"
							ng-dblclick="editModalItemLocationSeat(item.id)"
							ng-click="setSelected('selectedItemlocationSeats', item, $index)">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('locationrow')"><label>{{ item.locationrow.label }}</label></td>
						<td ng-show="checkVisibility('seat')"><label>{{ item.seat }}</label></td>
							<td>
								<a ng-click="editModalItemLocationSeat(item.id)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon-pencil"></i> 
								</a>
							</td>
							<td>
								<a ng-click="deleteSubItem('locationSeats', 'LocationSeat', item.id, $index)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ filteredLocationSeat.length }}/{{ item.locationSeats.length }}
				</div>
			</div>
		</div>
	</div>
</div>