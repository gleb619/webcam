<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div>
	<div class="row padding-left-right-15">
		<div class="btn-group without-padding display-block toolbar-panel margin-bottom-5">
			<button type="button" class="btn btn-default btn-reload"
				ng-click="pickItemRelUserSettings()">
				<i class="glyphicon glyphicon-list-alt pull-left"></i>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="default.pick" /></span>
			</button>
			<button type="button" class="btn btn-default btn-delete"
				ng-click="deleteSubItem('relUserSettingses', 'RelUserSettings', selectedItemrelUserSettingses.id, itemIndex)">
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

							<th style="width: 20px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in item.relUserSettingses track by $index"
							ng-class="{ 'success' : selectedItemrelUserSettingses.id == item.id }"
							ng-click="setSelected('selectedItemrelUserSettingses', item, $index)">
						<td ng-if="::checkVisibility('settings')"><label>{{ ::item.settings.label }}</label></td>
						<td ng-if="::checkVisibility('users')"><label>{{ ::item.users.label }}</label></td>
							<td>
								<a ng-click="deleteSubItem('relUserSettingses', 'RelUserSettings', item.id, $index)" class="btn">
									<i class="glyphicon glyphicons-lg glyphicon glyphicon-trash"></i>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<spring:message code="default.total" />: {{ item.relUserSettingses.length }}
				</div>
			  </div>
		</div>
	</div>
</div>