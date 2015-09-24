<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>    
<div class="my-container-3 sectors-holder">
	<div class="row sector-header">
		<div class="without-padding margin-bottom-5">
			<div class="btn-group">
				<button type="button" class="btn btn-default btn-create" ng-click="createModalNewItem()">
					<i class="fa fa-file-o pull-left"></i>
					<i class="fa fa-file pull-left"></i>
					<span>&nbsp;&nbsp;<spring:message code="default.create" /></span>
				</button>
				<button type="button" class="btn btn-default btn-edit" ng-click="editModalItem()">
					<i class="glyphicon glyphicon-pencil pull-left"></i>
					<span>&nbsp;&nbsp;<spring:message code="default.edit" /></span>
				</button>
				<button type="button" class="btn btn-default btn-delete" ng-click="deleteItem()">
					<i class="glyphicon glyphicon-trash pull-left"></i>
					<span>&nbsp;&nbsp;<spring:message code="default.delete" /></span>
				</button>
				<button type="button" class="btn btn-default btn-reload" ng-click="reloadData()">
					<i class="glyphicon glyphicon-repeat pull-left"></i>
					<span>&nbsp;&nbsp;<spring:message code="default.reload" /></span>
				</button>
			</div>
		<c:if test="${debug}">
			<div class="btn-group">
				<a href="../data/tmaccountaddresses?initLists=true&initDicts=true" 		target="_blank" class="btn btn-default"> JSON DATA </a>
				<a href="../data/tmaccountaddressesview?initLists=true&initDicts=true" 	target="_blank" class="btn btn-default"> JSON DATA FOR VIEW </a>
			</div>
		</c:if>
		</div>
		<div class="without-padding col-md-12">
			<div class="has-feedback filterBar">
				<input type="text" ng-model="searchKeywordTmAccountAddresses" class="form-control"
					   ng-model-options="{ debounce: 300 }" ng-change="search('filteredTmAccountAddresses', 'dataTmAccountAddresses', 'searchKeywordTmAccountAddresses')"
					   placeholder="<spring:message code="default.filterKeyword" />">
                <i class="form-control-feedback glyphicon glyphicon-search"></i>
            </div>
		</div>
	</div>
	<div class="row sector-1">
		<div class="col-md-12 without-padding scrollable-content-65">
		  <div class="table-responsive margin-bottom-5 table-body" when-scrolled="loadDataTmAccountAddresses()">
			<table class="table table-hover table-striped table-bordered margin-bottom-5 padding-all-2">
				<thead>
					<tr>
					<c:if test="${debug}">
						<th>
							<div ng-click="sort('id')">
								<a class="sortable-column-name"><span>id</span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.id, 'fa-caret-up': !details.id }"></i>
							</div>
						</th>
					</c:if>
						<th ng-if="::checkVisibility('label')">
							<div ng-click="sort('label')" >
								<a class="sortable-column-name"><span><spring:message code="label.label" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.label, 'fa-caret-up': !details.label }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('isdetail')">
							<div ng-click="sort('isdetail')" >
								<a class="sortable-column-name"><span><spring:message code="label.isDetail" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.isDetail, 'fa-caret-up': !details.isDetail }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('locationcities')">
							<div ng-click="sort('locationcities')" >
								<a class="sortable-column-name"><span><spring:message code="label.locationCities" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.locationCities, 'fa-caret-up': !details.locationCities }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('tmaccount')">
							<div ng-click="sort('tmaccount')" >
								<a class="sortable-column-name"><span><spring:message code="label.tmAccount" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.tmAccount, 'fa-caret-up': !details.tmAccount }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('zip')">
							<div ng-click="sort('zip')" >
								<a class="sortable-column-name"><span><spring:message code="label.zip" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.zip, 'fa-caret-up': !details.zip }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('address')">
							<div ng-click="sort('address')" >
								<a class="sortable-column-name"><span><spring:message code="label.address" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.address, 'fa-caret-up': !details.address }"></i>
							</div>
						</th>
						<th ng-if="::checkVisibility('addressname')">
							<div ng-click="sort('addressname')" >
								<a class="sortable-column-name"><span><spring:message code="label.addressName" /></span></a>
								<i class="fa" ng-class="{ 'fa-caret-down': details.addressName, 'fa-caret-up': !details.addressName }"></i>
							</div>
						</th>

						<th style="width: 20px;">&nbsp;</th>
						<th style="width: 20px;">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<!-- <tr ng-repeat="item in filteredTmAccountAddresses = ( dataTmAccountAddresses | filter:searchKeywordTmAccountAddresses | orderBy: details.sortableColumn: details.sortableReverse )" -->
					<tr ng-repeat="item in filteredTmAccountAddresses track by $index"
						ng-click="setSelectedItem(item)"
						ng-dblclick="editModalItem(item.id)"
						ng-class="{ 'success' : selectedItem.id == item.id }">
					<c:if test="${debug}">
						<td>{{ ::item.id }}</td>
					</c:if>
						<td ng-if="::checkVisibility('label')"><label>{{ ::item.label }}</label></td>
						<td ng-if="::checkVisibility('isdetail')" class="switch-td"><i ng-class="::{'fa fa-lg fa-check': item.isDetail, 'fa fa-lg fa-circle-o': !item.isDetail}"></i></td>
						<td ng-if="::checkVisibility('locationcities')"><label>{{ ::item.locationcities }}</label></td>
						<td ng-if="::checkVisibility('tmaccount')"><label>{{ ::item.tmaccount }}</label></td>
						<td ng-if="::checkVisibility('zip')"><label>{{ ::item.zip }}</label></td>
						<td ng-if="::checkVisibility('address')"><label>{{ ::item.address }}</label></td>
						<td ng-if="::checkVisibility('addressname')"><label>{{ ::item.addressname }}</label></td>
						<td>
							<button type="button" ng-click="editModalItem(item.id)" class="btn button-transparent">
								<i class="glyphicon glyphicon-pencil"></i> 
							</button>
						</td>
						<td>
							<button type="button" ng-click="deleteItem(item.id)" class="btn button-transparent">
								<i class="glyphicon glyphicon glyphicon-trash"></i>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		  </div>
		</div>
		<div class="col-md-12 margin-bottom-10">
			<div class="btn-toolbar">
				<div class="btn-group" dropdown>
					<button type="button" class="btn btn-default" ng-click="searchKeywordTmAccountAddresses = ''">
						<i class="fa fa-list-alt fa-lg"></i>
						<span> <spring:message code="default.total" />: {{ filteredTmAccountAddresses.length }} / {{ dataTmAccountAddresses.length }} </span>
					</button>
					<button type="button" class="btn btn-default btn-splitter dropdown-toggle" dropdown-toggle>
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-click="searchKeywordTmAccountAddresses = ''"><spring:message code="default.ShowAll" /></a></li>
						<li><a ng-click="sort('createon', false)"><spring:message code="default.ShowLast" /></a></li>
					</ul>
				</div>
				<div class="btn-group" dropdown>
					<button type="button" class="btn btn-primary" ng-click="loadDataTmAccountAddresses()">
						<i class="fa fa-lg" ng-class="{'fa-refresh fa-spin': scrollable.dataLoading, 'fa-database': !scrollable.dataLoading}"></i>
						<span><spring:message code="default.loadMore" /></span>
					</button>
					<button type="button" class="btn btn-primary btn-splitter dropdown-toggle" dropdown-toggle>
						<span class="caret"></span>
						<span class="sr-only">Split button!</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a ng-click="loadDataTmAccountAddresses()"><spring:message code="default.loadMore" /></a></li>
						<li><a ng-click="loadAllDataTmAccountAddresses()"><spring:message code="default.loadAll" /></a></li>
					</ul>
				</div>
  			</div>
		</div>
		</div>
	<div class="row sector-2">
		<div class="col-md-12 separator" />
		
		<div class="col-md-12 margin-top-15">
			<tabset >
			
					<tab>
						<tab-heading>
							<spring:message code="label.descr"/>
						</tab-heading>
						
						<div class="custom-textarea-holder">
							<pre ng-bind-html="selectedItem.descr"></pre>
						</div>
					</tab>
					
					
			</tabset>
		</div>
	</div>
	</div>
	<!--</div>-->
