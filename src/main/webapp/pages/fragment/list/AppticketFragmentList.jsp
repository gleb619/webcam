<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordAppTicket" name="searchKeywordAppTicket"
							ng-model="searchKeywordAppTicket" class="form-control"
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
						<th ng-show="checkVisibility('appevent')">
							<div ng-click="sort('appevent')" >
								<a class="sortable-column-name"><span><spring:message code="label.appEvent" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.appEvent"></i>
								<i class="fa fa-caret-up" ng-hide="details.appEvent"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('dictglobal')">
							<div ng-click="sort('dictglobal')" >
								<a class="sortable-column-name"><span><spring:message code="label.dictGlobal" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.dictGlobal"></i>
								<i class="fa fa-caret-up" ng-hide="details.dictGlobal"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('locationseat')">
							<div ng-click="sort('locationseat')" >
								<a class="sortable-column-name"><span><spring:message code="label.locationSeat" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.locationSeat"></i>
								<i class="fa fa-caret-up" ng-hide="details.locationSeat"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('barcode')">
							<div ng-click="sort('barcode')" >
								<a class="sortable-column-name"><span><spring:message code="label.barcode" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.barcode"></i>
								<i class="fa fa-caret-up" ng-hide="details.barcode"></i>
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
							ng-repeat="item in filteredAppTicket = ( selectedItem.appTickets | filter:searchKeywordAppTicket )"
							ng-click="setSelected('selectedItemappTickets', item, $index)"
							ng-class="{ 'success' : selectedItemappTickets.id == item.id }">
						<td ng-show="checkVisibility('label')"><label>{{ item.label }}</label></td>
						<td ng-show="checkVisibility('appevent')"><label>{{ item.appevent }}</label></td>
						<td ng-show="checkVisibility('dictglobal')"><label>{{ item.dictglobal }}</label></td>
						<td ng-show="checkVisibility('locationseat')"><label>{{ item.locationseat }}</label></td>
						<td ng-show="checkVisibility('barcode')"><label>{{ item.barcode }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredAppTicket.length }}/{{ selectedItem.appTickets.length }}
				</div>
			  </div>
		</div>
	</div>
</div>