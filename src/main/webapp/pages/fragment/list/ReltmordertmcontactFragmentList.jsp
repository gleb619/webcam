<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="padding-top-10">
	<div class="row">
			<div class="col-md-12">
			  <div class="table-responsive">
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<tr>
						<th ng-if="::checkVisibility('tmorder')">
							<div ng-click="sort('tmorder')" >
								<a class="sortable-column-name"><span><spring:message code="label.tmOrder" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.tmOrder, 'fa-caret-up': !details.tmOrder }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('tmcontact')">
							<div ng-click="sort('tmcontact')" >
								<a class="sortable-column-name"><span><spring:message code="label.tmContact" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.tmContact, 'fa-caret-up': !details.tmContact }"></i>
							</div>
						</th>

						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in selectedItem.relTmOrderTmContacts track by $index">
						<td ng-if="::checkVisibility('tmorder')"><label>{{ ::item.tmorder }}</label></td>
						<td ng-if="::checkVisibility('tmcontact')"><label>{{ ::item.tmcontact }}</label></td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ filteredRelTmOrderTmContact.length }}/{{ selectedItem.relTmOrderTmContacts.length }}
				</div>
			  </div>
		</div>
	</div>
</div>