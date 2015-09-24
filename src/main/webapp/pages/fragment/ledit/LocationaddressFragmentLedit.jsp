<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div>
	<div class="row">
		<div class="padding-left-right-15">
			<div class="btn-group without-padding display-block toolbar-panel margin-bottom-5">
				<button type="button" class="btn btn-default btn-create"
					ng-click="createModalItemLocationAddress()">
					<i class="fa fa-file-o pull-left"></i>
					<i class="fa fa-file pull-left"></i>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="default.create" /></span>
				</button>
				<button type="button" class="btn btn-default btn-edit"
					ng-click="editModalItemLocationAddress(selectedItemlocationAddresses.id)">
					<i class="glyphicon glyphicon-pencil pull-left"></i>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="default.edit" /></span>
				</button>
				<button type="button" class="btn btn-default btn-delete"
					ng-click="deleteSubItem('locationAddresses', 'LocationAddress', selectedItemlocationAddresses.id, itemIndex)">
					<i class="glyphicon glyphicon-trash pull-left"></i>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="default.delete" /></span>
				</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive margin-bottom-5 table-body ledit-scroll">
				<table class="table table-hover table-striped table-bordered margin-bottom-5 padding-all-2">
					<thead>
						<tr>
						<th ng-if="::checkVisibility('label')">
							<div ng-click="sort('label')" >
								<a class="sortable-column-name"><span><spring:message code="label.label" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.label, 'fa-caret-up': !details.label }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('gmappointx')">
							<div ng-click="sort('gmappointx')" >
								<a class="sortable-column-name"><span><spring:message code="label.gmapPointX" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.gmapPointX, 'fa-caret-up': !details.gmapPointX }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('nameeng')">
							<div ng-click="sort('nameeng')" >
								<a class="sortable-column-name"><span><spring:message code="label.nameeng" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.nameeng, 'fa-caret-up': !details.nameeng }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('gmappointy')">
							<div ng-click="sort('gmappointy')" >
								<a class="sortable-column-name"><span><spring:message code="label.gmapPointY" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.gmapPointY, 'fa-caret-up': !details.gmapPointY }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('metro')">
							<div ng-click="sort('metro')" >
								<a class="sortable-column-name"><span><spring:message code="label.metro" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.metro, 'fa-caret-up': !details.metro }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('name')">
							<div ng-click="sort('name')" >
								<a class="sortable-column-name"><span><spring:message code="label.name" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.name, 'fa-caret-up': !details.name }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('roadmap')">
							<div ng-click="sort('roadmap')" >
								<a class="sortable-column-name"><span><spring:message code="label.roadMap" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.roadMap, 'fa-caret-up': !details.roadMap }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('yandexmappointx')">
							<div ng-click="sort('yandexmappointx')" >
								<a class="sortable-column-name"><span><spring:message code="label.yandexMapPointX" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.yandexMapPointX, 'fa-caret-up': !details.yandexMapPointX }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('yandexmappointy')">
							<div ng-click="sort('yandexmappointy')" >
								<a class="sortable-column-name"><span><spring:message code="label.yandexMapPointY" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.yandexMapPointY, 'fa-caret-up': !details.yandexMapPointY }"></i>
							</div>
						</th>

							<th style="width: 20px;">&nbsp;</th>
							<th style="width: 20px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in item.locationAddresses track by $index"
							ng-class="{ 'success' : selectedItemlocationAddresses.id == item.id }"
							ng-dblclick="editModalItemLocationAddress(item.id)"
							ng-click="setSelected('selectedItemlocationAddresses', item, $index)">
						<td ng-if="::checkVisibility('label')"><label>{{ ::item.label }}</label></td>
						<td ng-if="::checkVisibility('gmappointx')"><label>{{ ::item.gmappointx }}</label></td>
						<td ng-if="::checkVisibility('nameeng')"><label>{{ ::item.nameeng }}</label></td>
						<td ng-if="::checkVisibility('gmappointy')"><label>{{ ::item.gmappointy }}</label></td>
						<td ng-if="::checkVisibility('metro')"><label>{{ ::item.metro }}</label></td>
						<td ng-if="::checkVisibility('name')"><label>{{ ::item.name }}</label></td>
						<td ng-if="::checkVisibility('roadmap')"><label>{{ ::item.roadmap }}</label></td>
						<td ng-if="::checkVisibility('yandexmappointx')"><label>{{ ::item.yandexmappointx }}</label></td>
						<td ng-if="::checkVisibility('yandexmappointy')"><label>{{ ::item.yandexmappointy }}</label></td>
							<td>
								<a ng-click="editModalItemLocationAddress(item.id)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon-pencil"></i> 
								</a>
							</td>
							<td>
								<a ng-click="deleteSubItem('locationAddresses', 'LocationAddress', item.id, $index)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ item.locationAddresses.length }}
				</div>
			</div>
		</div>
	</div>
</div>