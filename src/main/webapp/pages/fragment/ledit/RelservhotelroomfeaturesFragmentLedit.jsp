<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div>
	<div class="row padding-left-right-15">
		<div class="btn-group without-padding display-block toolbar-panel margin-bottom-5">
			<button type="button" class="btn btn-default btn-reload"
				ng-click="pickItemRelServHotelRoomFeatures()">
				<i class="glyphicon glyphicon-list-alt pull-left"></i>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="default.pick" /></span>
			</button>
			<button type="button" class="btn btn-default btn-delete"
				ng-click="deleteSubItem('relServHotelRoomFeatureses', 'RelServHotelRoomFeatures', selectedItemrelServHotelRoomFeatureses.id, itemIndex)">
				<i class="glyphicon glyphicon-trash pull-left"></i>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="default.delete" /></span>
			</button>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			  <div class="table-responsive margin-bottom-5 table-body ledit-scroll">
				<table class="table table-hover table-striped table-bordered 
						  margin-bottom-5 padding-all-2">
					<thead>
						<tr>
						<th ng-if="::checkVisibility('servhotelroom')">
							<div ng-click="sort('servhotelroom')" >
								<a class="sortable-column-name"><span><spring:message code="label.servHotelRoom" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.servHotelRoom, 'fa-caret-up': !details.servHotelRoom }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('dictglobal')">
							<div ng-click="sort('dictglobal')" >
								<a class="sortable-column-name"><span><spring:message code="label.dictGlobal" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.dictGlobal, 'fa-caret-up': !details.dictGlobal }"></i>
							</div>
						</th>

							<th style="width: 20px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in item.relServHotelRoomFeatureses track by $index"
							ng-class="{ 'success' : selectedItemrelServHotelRoomFeatureses.id == item.id }"
							ng-click="setSelected('selectedItemrelServHotelRoomFeatureses', item, $index)">
						<td ng-if="::checkVisibility('servhotelroom')"><label>{{ ::item.servhotelroom.label }}</label></td>
						<td ng-if="::checkVisibility('dictglobal')"><label>{{ ::item.dictglobal.label }}</label></td>
							<td>
								<a ng-click="deleteSubItem('relServHotelRoomFeatureses', 'RelServHotelRoomFeatures', item.id, $index)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ item.relServHotelRoomFeatureses.length }}
				</div>
			  </div>
		</div>
	</div>
</div>