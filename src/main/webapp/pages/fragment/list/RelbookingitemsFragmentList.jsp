<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12 filterBar">
				<div class="fill-content has-feedback">
					<input type="text" id="searchKeywordRelBookingItems" name="searchKeywordRelBookingItems"
							ng-model="searchKeywordRelBookingItems" class="form-control"
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
						<th ng-show="checkVisibility('pricebooking')">
							<div ng-click="sort('pricebooking')" >
								<a class="sortable-column-name"><span><spring:message code="label.priceBooking" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.priceBooking"></i>
								<i class="fa fa-caret-up" ng-hide="details.priceBooking"></i>
							</div>
						</th>
						<th ng-show="checkVisibility('locationseat')">
							<div ng-click="sort('locationseat')" >
								<a class="sortable-column-name"><span><spring:message code="label.locationSeat" /></span></a>
								<i class="fa fa-caret-down" ng-show="details.locationSeat"></i>
								<i class="fa fa-caret-up" ng-hide="details.locationSeat"></i>
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
							ng-repeat="item in filteredRelBookingItems = ( selectedItem.relBookingItemses | filter:searchKeywordRelBookingItems )"
							ng-click="setSelected('selectedItemrelBookingItemses', item, $index)"
							ng-class="{ 'success' : selectedItemrelBookingItemses.id == item.id }">
						<td ng-show="checkVisibility('pricebooking')"><label>{{ item.pricebooking }}</label></td>
						<td ng-show="checkVisibility('locationseat')"><label>{{ item.locationseat }}</label></td>
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
					<spring:message code="default.total" />: {{ filteredRelBookingItems.length }}/{{ selectedItem.relBookingItemses.length }}
				</div>
			  </div>
		</div>
	</div>
</div>