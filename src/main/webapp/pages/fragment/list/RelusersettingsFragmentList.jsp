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
						<th ng-if="::checkVisibility('settings')">
							<div ng-click="sort('settings')" >
								<a class="sortable-column-name"><span><spring:message code="label.settings" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.settings, 'fa-caret-up': !details.settings }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('users')">
							<div ng-click="sort('users')" >
								<a class="sortable-column-name"><span><spring:message code="label.users" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.users, 'fa-caret-up': !details.users }"></i>
							</div>
						</th>

						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in selectedItem.relUserSettingses track by $index">
						<td ng-if="::checkVisibility('settings')"><label>{{ ::item.settings }}</label></td>
						<td ng-if="::checkVisibility('users')"><label>{{ ::item.users }}</label></td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ filteredRelUserSettings.length }}/{{ selectedItem.relUserSettingses.length }}
				</div>
			  </div>
		</div>
	</div>
</div>